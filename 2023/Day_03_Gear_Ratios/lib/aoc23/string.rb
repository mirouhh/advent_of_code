class String
  def symbols
    search_pattern = /(?=(\w|\.))/i
    non_symbols = scan(search_pattern).flatten
    symbol_string = delete non_symbols.join
    symbols = symbol_string.chars
    symbols = symbols.uniq unless symbols.empty?
    symbols
  end

  def numbers
    search_pattern = /\d+/i
    scan(search_pattern).flatten
  end
end
