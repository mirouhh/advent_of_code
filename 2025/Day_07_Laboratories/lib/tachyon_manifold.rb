class TachyonManifold

  attr_reader :valid_symbols, :start, :space, :splitter, :beam

  def initialize
    @start = 'S'
    @space = '.'
    @beam = '|'
    @splitter = '^'
    @valid_symbols = [start, space, splitter, beam]
  end

  def valid_symbol?(symbol)
    @valid_symbols.include? symbol
  end

  def is_start?(symbol)
    symbol == @start
  end

  def is_space?(symbol)
    symbol == @space
  end

  def is_splitter?(symbol)
    symbol == @splitter
  end

  def is_beam?(symbol)
    symbol == @beam
  end

end
