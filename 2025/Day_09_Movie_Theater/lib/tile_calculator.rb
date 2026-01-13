require 'set'

RedTile = Data.define(:col, :row)
GreenTile = Data.define(:col, :row)

class TileCalculator

  attr_reader :rectangles, :red_tiles, :green_tiles, :valid_areas

  def initialize
    @red_tiles = []
    @rectangles = []
    @green_tiles = []
    @green_by_col = Hash.new { |h, k| h[k] = [] }
    @valid_areas = []
    @allowed_by_row = {}
    @sorted_rows = []
  end

  def empty?
    @red_tiles.empty? && @rectangles.empty? && @green_tiles.empty? && @valid_areas.empty?
  end

  def add_red_tile(col, row)
    @red_tiles << RedTile.new(col, row)
  end

  def add_green_tile(col, row)
    green_tile = GreenTile.new(col, row)
    @green_tiles << green_tile
    @green_by_col[col] << row
  end


  def clean
    @red_tiles.clear
    @rectangles.clear
    @green_tiles.clear
    @green_by_col.clear
    @valid_areas.clear
    @allowed_by_row.clear
    @sorted_rows = []
  end

  def import(file)
    File.readlines("#{file}", chomp: true).reject(&:empty?).each do |line |
      x, y = line.split(',').map(&:to_i)
      add_red_tile(x, y)
    end
  end

  def calculate_rectangles
    @rectangles = @red_tiles.combination(2).map do | red_tile_1, red_tile_2 |
      ((red_tile_1.col - red_tile_2.col).abs + 1) * ((red_tile_1.row - red_tile_2.row).abs + 1)
    end
  end

  def max
    @rectangles.max
  end

  def add_green_tiles
    return if @red_tiles.empty?

    # Auch die alte Methode für Kompatibilität
    @red_tiles.each_cons(2) { |t1, t2| add_line_between(t1, t2) }
    add_line_between(@red_tiles.last, @red_tiles.first) if @red_tiles.size > 2

    # Koordinatenkompression + Flood-Fill für schnelle valid?-Prüfung
    build_compressed_grid
  end

  def valid?(tile1, tile2)
    min_col, max_col = [tile1.col, tile2.col].minmax
    min_row, max_row = [tile1.row, tile2.row].minmax

    # Prüfe alle kritischen Y-Koordinaten
    critical_rows = Set.new([min_row, max_row])
    @sorted_rows.each { |r| critical_rows.add(r) if r > min_row && r < max_row }

    critical_rows.all? { |row| col_range_covered?(min_col, max_col, row) }
  end

  def calculate_valid_rectangles
    pairs = @red_tiles.combination(2).map do |tile1, tile2|
      area = ((tile1.col - tile2.col).abs + 1) * ((tile1.row - tile2.row).abs + 1)
      [area, tile1, tile2]
    end.sort_by { |area, _, _| -area }

    max_area = 0
    pairs.each do |area, tile1, tile2|
      break if area <= max_area
      max_area = area if valid?(tile1, tile2)
    end

    @valid_areas = [max_area]
  end

  def max_valid_area
    @valid_areas.max
  end

  private

  def add_line_between(tile1, tile2)
    if tile1.row == tile2.row
      fill_between(tile1.col, tile2.col) { |col| GreenTile.new(col, tile1.row) }
    elsif tile1.col == tile2.col
      fill_between(tile1.row, tile2.row) { |row| GreenTile.new(tile1.col, row) }
    end
  end

  def fill_between(a, b)
    (([a, b].min + 1)...[a, b].max).each do |i|
      tile = yield(i)
      @green_tiles << tile
      @green_by_col[tile.col] << tile.row
    end
  end

  def build_compressed_grid
    sorted_cols, col_to_idx, row_to_idx = build_coordinate_mappings
    border = build_border_set(sorted_cols, col_to_idx, row_to_idx)
    outside = flood_fill_outside(sorted_cols, border)
    build_allowed_ranges(sorted_cols, col_to_idx, row_to_idx, border, outside)
  end

  def build_coordinate_mappings
    all_cols, all_rows = collect_coordinates
    add_boundary_and_gap_coordinates(all_cols, all_rows)

    sorted_cols = all_cols.to_a.sort
    @sorted_rows = all_rows.to_a.sort

    col_to_idx = sorted_cols.each_with_index.to_h
    row_to_idx = @sorted_rows.each_with_index.to_h

    [sorted_cols, col_to_idx, row_to_idx]
  end

  def collect_coordinates
    all_cols = Set.new
    all_rows = Set.new
    @red_tiles.each { |t| all_cols.add(t.col); all_rows.add(t.row) }
    [all_cols, all_rows]
  end

  def add_boundary_and_gap_coordinates(all_cols, all_rows)
    min_col, max_col = all_cols.minmax
    min_row, max_row = all_rows.minmax

    [all_cols, all_rows].zip([[min_col, max_col], [min_row, max_row]]).each do |set, (min, max)|
      set.add(min - 1)
      set.add(max + 1)
    end

    add_gap_coordinates(all_cols)
    add_gap_coordinates(all_rows)
  end

  def add_gap_coordinates(coord_set)
    coord_set.to_a.sort.each_cons(2) { |a, b| coord_set.add(a + 1) if b - a > 1 }
  end

  def build_border_set(sorted_cols, col_to_idx, row_to_idx)
    border = Set.new
    get_polygon_edges.each do |edge|
      add_edge_to_border(edge, sorted_cols, col_to_idx, row_to_idx, border)
    end
    border
  end

  def add_edge_to_border(edge, sorted_cols, col_to_idx, row_to_idx, border)
    (c1, r1), (c2, r2) = edge
    if c1 == c2
      r_min, r_max = [r1, r2].minmax
      @sorted_rows.each { |r| border.add([col_to_idx[c1], row_to_idx[r]]) if r.between?(r_min, r_max) }
    else
      c_min, c_max = [c1, c2].minmax
      sorted_cols.each { |c| border.add([col_to_idx[c], row_to_idx[r1]]) if c.between?(c_min, c_max) }
    end
  end

  def flood_fill_outside(sorted_cols, border)
    outside = Set.new
    queue = initial_flood_fill_queue(sorted_cols.length, @sorted_rows.length)

    until queue.empty?
      ci, ri = queue.shift
      next unless valid_grid_position?(ci, ri, sorted_cols.length, @sorted_rows.length)
      next if outside.include?([ci, ri]) || border.include?([ci, ri])

      outside.add([ci, ri])
      queue.push([ci + 1, ri], [ci - 1, ri], [ci, ri + 1], [ci, ri - 1])
    end
    outside
  end

  def initial_flood_fill_queue(cols_count, rows_count)
    queue = []
    cols_count.times { |ci| queue << [ci, 0] << [ci, rows_count - 1] }
    rows_count.times { |ri| queue << [0, ri] << [cols_count - 1, ri] }
    queue
  end

  def valid_grid_position?(ci, ri, cols_count, rows_count)
    ci >= 0 && ci < cols_count && ri >= 0 && ri < rows_count
  end

  def build_allowed_ranges(sorted_cols, col_to_idx, row_to_idx, border, outside)
    min_col, max_col = sorted_cols.first + 1, sorted_cols.last - 1
    min_row, max_row = @sorted_rows.first + 1, @sorted_rows.last - 1

    @sorted_rows.each do |row|
      next unless row.between?(min_row, max_row)
      ranges = collect_ranges_for_row(row, sorted_cols, col_to_idx, row_to_idx, border, outside, min_col, max_col)
      @allowed_by_row[row] = expand_and_merge_ranges(ranges, col_to_idx, sorted_cols)
    end
  end

  def collect_ranges_for_row(row, sorted_cols, col_to_idx, row_to_idx, border, outside, min_col, max_col)
    ri = row_to_idx[row]
    ranges = []
    current_start = nil
    prev_col = nil

    sorted_cols.each do |col|
      next unless col.between?(min_col, max_col)
      is_allowed = point_allowed?(col_to_idx[col], ri, border, outside)
      current_start, ranges = update_ranges(is_allowed, col, current_start, prev_col, ranges)
      prev_col = col
    end

    ranges << [current_start, prev_col] if current_start
    ranges
  end

  def point_allowed?(ci, ri, border, outside)
    border.include?([ci, ri]) || !outside.include?([ci, ri])
  end

  def update_ranges(is_allowed, col, current_start, prev_col, ranges)
    if is_allowed
      [current_start || col, ranges]
    elsif current_start
      ranges << [current_start, prev_col]
      [nil, ranges]
    else
      [nil, ranges]
    end
  end

  def expand_and_merge_ranges(ranges, col_to_idx, sorted_cols)
    return [] if ranges.empty?

    expanded = ranges.map { |c_start, c_end| expand_range(c_start, c_end, col_to_idx, sorted_cols) }
    merge_overlapping_ranges(expanded)
  end

  def expand_range(c_start, c_end, col_to_idx, sorted_cols)
    ci_end = col_to_idx[c_end]
    actual_end = ci_end + 1 < sorted_cols.length ? sorted_cols[ci_end + 1] - 1 : c_end
    [c_start, actual_end]
  end

  def merge_overlapping_ranges(ranges)
    ranges.sort!
    merged = [ranges[0].dup]

    ranges[1..].each do |s, e|
      if s <= merged[-1][1] + 1
        merged[-1][1] = [merged[-1][1], e].max
      else
        merged << [s, e]
      end
    end
    merged
  end

  def get_polygon_edges
    @red_tiles.each_cons(2).map { |t1, t2| [[t1.col, t1.row], [t2.col, t2.row]] } +
      [[[@red_tiles.last.col, @red_tiles.last.row], [@red_tiles.first.col, @red_tiles.first.row]]]
  end

  def get_allowed_ranges(row)
    return @allowed_by_row[row] if @allowed_by_row.key?(row)

    @sorted_rows.each_cons(2) do |r1, r2|
      if r1 < row && row < r2
        rep_row = r1 + 1
        return @allowed_by_row[rep_row] if @allowed_by_row.key?(rep_row)
        return @allowed_by_row.fetch(r1, [])
      end
    end
    []
  end

  def col_range_covered?(min_col, max_col, row)
    ranges = get_allowed_ranges(row)
    ranges.any? { |r_min, r_max| r_min <= min_col && max_col <= r_max }
  end

end
