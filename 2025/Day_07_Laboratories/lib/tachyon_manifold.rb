class TachyonManifold

  attr_reader :diagram
  attr_accessor :start, :space, :splitter, :beam

  def initialize
    @symbols = []
    @diagram = []
  end

  def valid?(symbol)
    symbols.include? symbol
  end

  def start?(symbol)
    symbol == @start
  end

  def space?(symbol)
    symbol == @space
  end

  def splitter?(symbol)
    symbol == @splitter
  end

  def beam?(symbol)
    symbol == @beam
  end

  def import(diagram)
    @diagram = diagram
  end

  def start_position
    row = @diagram.find_index { |line | line.include?(@start) }
    col = @diagram[row].index(@start) if row
    [row, col]
  end

  def symbols
    [@start, @space, @splitter, @beam].compact
  end

  def reset_diagram
    @diagram.clear
  end

  def reset_symbols
    @start = nil
    @space = nil
    @splitter = nil
    @beam = nil
    @symbols.clear
  end

  def reset
    reset_diagram
    reset_symbols
  end

  def splitter_positions
    splitter_positions = []

    @diagram.each_with_index.flat_map do |row, r|
      row.chars.each_with_index.filter_map { |char, c| splitter_positions << [r, c] if splitter? char }
    end

    splitter_positions
  end

  def total_splits
    search_range.reduce([0, Set.new([start_col])]) do |(total, beams), row|
      splits, next_beams = process_beam_row(beams, row, width)
      [total + splits, next_beams]
    end.first
  end

  def total_timelines
   final_beams = search_range.reduce({start_col => 1}) do |beams, row|
      process_timeline_row(beams, row, width)
    end

    final_beams.values.sum
  end


  def to_s
    @diagram.join("\n")
  end

  private

  def process_timeline_row(beams, row, width)
    next_beams = Hash.new(0)

    beams.each do |col, path_count|
      distribute_paths(col, path_count, row, width, next_beams)
    end

    next_beams
  end

  def distribute_paths(col, path_count, row, width, next_beams)
    next_positions(col, row, width).each do |pos|
      next_beams[pos] += path_count
    end
  end


  def search_range
    (start_row + 1)...height
  end

  def start_row
    start_position.first
  end

  def start_col
    start_position.last
  end

  def height
    @diagram.length
  end

  def width
    @diagram[0].length
  end

  # Verarbeitet eine einzelne Zeile
  def process_beam_row(beams, row, width)
    next_beams = Set.new

    beams.each do |col|
      next_positions(col, row, width).each { |pos| next_beams.add(pos) }
    end

    splits = count_splits_in_row(beams, row)
    [splits, next_beams]
  end

  # Berechnet wohin ein Strahl geht
  def next_positions(col, row, width)
    positions = splitter_positions.include?([row, col]) ? [col - 1, col + 1] : [col]
    positions.select { |pos| pos.between?(0, width - 1) }
  end

  # Zählt Splits in einer Zeile
  def count_splits_in_row(beams, row)
    beams.count { |col| splitter_positions.include?([row, col]) }
  end

end
