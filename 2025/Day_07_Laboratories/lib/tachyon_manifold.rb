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
    require 'set'

    height = @diagram.length
    width = @diagram[0].length

    # Startposition verwenden (nur die Spalte)
    start_row, start_col = start_position

    # Splitter-Positionen als Hash für schnellen Lookup
    splitters = {}
    splitter_positions.each { |pos| splitters[pos] = true }

    # Simulation: Set von aktiven Spalten
    active_beams = Set.new([start_col])
    total_splits = 0

    # Zeile für Zeile ab der Zeile nach dem Start
    (start_row + 1...height).each do |y|
      next_beams = Set.new
      splits_this_row = 0

      active_beams.each do |x|
        if splitters[[y, x]]
          # Strahl trifft auf Splitter -> Split!
          splits_this_row += 1
          # Zwei neue Strahlen links und rechts
          next_beams.add(x - 1) if x > 0
          next_beams.add(x + 1) if x < width - 1
        else
          # Strahl geht weiter nach unten
          next_beams.add(x)
        end
      end

      total_splits += splits_this_row
      active_beams = next_beams
    end

    total_splits
  end


end
