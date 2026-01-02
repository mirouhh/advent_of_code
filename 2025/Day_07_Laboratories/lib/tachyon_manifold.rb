class TachyonManifold

  def valid_symbols
    ['S', '.', '^', '|']
  end

  def start_symbol
    'S'
  end

  def space_symbol
    '.'
  end

  def splitter_symbol
    '^'
  end

  def beam_symbol
    '|'
  end

  def valid_symbol?(symbol)
    valid_symbols.include?(symbol)
  end

end
