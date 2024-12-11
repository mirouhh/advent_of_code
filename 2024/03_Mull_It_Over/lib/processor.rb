class Processor

  attr_reader :instructions

  def self.scan(input)
    search_pattern = /(?<!\d)mul\(\d{1,3},\d{1,3}\)(?!\d)/
    @instructions = input.scan(search_pattern)
  end

  def self.instructions
    @instructions
  end

  def self.process
    161
  end
end
