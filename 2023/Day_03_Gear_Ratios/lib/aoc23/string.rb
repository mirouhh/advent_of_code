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

  def indexes(character)
    indexes = []
    chars.each_index do |index|
      indexes << index if character.eql?(chars[index])
    end
    indexes
  end
end
