class String
  def symbols
    search_pattern = /(?=(\*))/i
    scan(search_pattern).flatten
  end

end
