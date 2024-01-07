class String
  def symbols
    search_pattern = /(?=(\w|\.))/i
    symbols = scan(search_pattern).flatten
    symbols = delete symbols.join
    symbols = symbols.chars.uniq unless symbols.empty?
    symbols
  end
end
