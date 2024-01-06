class String
  def symbols
    search_pattern = /(?=(\*))/i
    symbols = scan(search_pattern).flatten
    symbols.uniq! unless symbols.empty?
    symbols
  end
end
