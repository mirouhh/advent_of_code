class String
  def int_array
    search_pattern = /(one|two|three|four|five|six|seven|eight|nine|\d)/i
    self.scan(search_pattern).flatten
  end

  def to_digit
    numbers = ['one','two','three','four','five','six','seven','eight','nine']
    (numbers.include? self.downcase) ? ((numbers.index self.downcase) + 1).to_s : self
  end
end
