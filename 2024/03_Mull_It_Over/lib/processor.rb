require_relative 'calculator'

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
    result = 0
    @instructions.each do |instruction|
      factors = instruction.scan(/(?<!\d)(\d{1,3})(?=\D.*?(\d{1,3}))/).flatten
      result += Calculator.mul(factors[0].to_i, factors[1].to_i)
    end
    result
  end
end
