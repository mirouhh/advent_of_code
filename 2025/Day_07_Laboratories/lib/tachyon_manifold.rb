class TachyonManifold

  attr_reader :diagram
  attr_writer :start, :space, :splitter, :beam

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

end
