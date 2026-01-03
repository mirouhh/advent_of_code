class TachyonManifold

  attr_reader :valid_symbols, :start, :space, :splitter, :beam, :diagram

  def initialize
    @start = 'S'
    @space = '.'
    @beam = '|'
    @splitter = '^'
    @valid_symbols = [start, space, splitter, beam]
    @diagram = []
  end

  def valid?(symbol)
    @valid_symbols.include? symbol
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

end
