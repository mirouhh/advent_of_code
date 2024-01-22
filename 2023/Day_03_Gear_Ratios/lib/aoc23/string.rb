class String
  def symbols
    search_pattern = /[^0-9a-z.]/i
    scan(search_pattern)
  end

  def numbers
    search_pattern = /\d+/i
    scan(search_pattern).flatten
  end

  def indexes(substring)
    indexes = []
    start_index = 0

    while start_index = index(substring, start_index)
      end_index = start_index + substring.length
      indexes << start_index
      start_index = end_index
    end
    indexes
  end
end
