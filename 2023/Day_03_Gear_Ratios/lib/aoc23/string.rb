class String
  def symbols
    search_pattern = /(?=(\w|\.))/i
    non_symbols = scan(search_pattern).flatten
    symbol_string = delete non_symbols.join
    symbol_string.chars
  end

  def numbers
    search_pattern = /\d+/i
    scan(search_pattern).flatten
  end
end
