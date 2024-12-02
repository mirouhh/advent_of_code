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

    search_pattern = /[^0-9a-z.]/i
    search_pattern = /\d+/ if substring.match?(/[^0-9a-z.]/i)

    b1 = true
    b2 = true

    while start_index = index(substring, start_index)
      end_index = start_index + substring.length
      if substring.match?(/[0-9]/)
        b1 = self[start_index - 1].match?(/[^0-9]/i) unless self[start_index - 1].nil?
        b2 = self[start_index + substring.length].match?(/[^0-9]/i) unless self[start_index + substring.length].nil?
      end
      indexes << start_index if (b1 && b2)
      start_index = end_index
    end
    indexes
  end

end
