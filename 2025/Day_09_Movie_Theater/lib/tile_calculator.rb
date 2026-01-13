RedTile = Data.define(:col, :row)
GreenTile = Data.define(:col, :row)

class TileCalculator

  attr_reader :rectangles, :red_tiles, :green_tiles, :valid_areas

  def initialize
    @red_tiles = []
    @rectangles = []
    @green_tiles = []
    @valid_areas = []
  end

  def empty?
    @red_tiles.empty? && @rectangles.empty? && @green_tiles.empty? && @valid_areas.empty?
  end

  def add_red_tile(col, row)
    @red_tiles << RedTile.new(col, row)
  end

  def clean
    @red_tiles.clear
    @rectangles.clear
    @green_tiles.clear
    @valid_areas.clear
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
    @red_tiles.empty? ? return : calculate_green_tiles
  end

  def calculate_green_tiles
    @red_tiles.each_cons(2) do |tile1, tile2|
      add_line_between(tile1, tile2)
    end

    add_line_between(@red_tiles.last, @red_tiles.first) if @red_tiles.size > 2
  end

  def valid?(tile1, tile2)
    true
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
    (([a, b].min + 1)...[a, b].max).each { |i| @green_tiles << yield(i) }
  end

end
