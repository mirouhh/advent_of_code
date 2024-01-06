class String
  def symbols
    search_pattern = /(?=(\*))/i
    symbols = scan(search_pattern).flatten
    unless symbols.empty?
      symbols.uniq!
    end
    symbols
  end
end
