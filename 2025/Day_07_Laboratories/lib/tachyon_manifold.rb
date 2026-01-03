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
    row_index = @diagram.find_index { |row| row.include?(@start) }
    col_index = @diagram[row_index].index(@start) if row_index
    [row_index, col_index]
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

    @diagram.each_with_index do |row, r|
      row.chars.each_with_index do |char, c|
        splitter_positions << [r, c] if splitter? char
      end
    end

    splitter_positions
  end

  def total_splits

    height = @diagram.length
    width = @diagram[0].length
    start_row, start_col = start_position

    (start_row + 1...height).reduce([0, Set.new([start_col])]) do |(total, beams), row|
      splits, next_beams = process_beam_row(beams, row, width)
      [total + splits, next_beams]
    end.first
  end

  private

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
