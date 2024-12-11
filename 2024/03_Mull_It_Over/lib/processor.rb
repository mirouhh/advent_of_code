require_relative 'calculator'

class Processor

  attr_reader :instructions

  def self.scan(input)
    @extended = false
    search_pattern = /(?<!\d)mul\(\d{1,3},\d{1,3}\)(?!\d)/
    @instructions = input.scan(search_pattern)
  end

  def self.scan_extended(input)
    @extended = true
    search_pattern = /do\(\)|don't\(\)|mul\(\d{1,3},\d{1,3}\)/
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

  def self.process_extended
    if @extended
      last_do_not = @instructions.rindex("don't()")
      last_do = @instructions.rindex("do()")
      clean_up_instructions(last_do_not, last_do)
    end

    process
  end

  def self.clean_up_instructions(last_do_not, last_do)
    #left_values = @instructions.values_at(0..(last_do_not - 1))
    #right_values = @instructions.values_at((last_do + 1)..(@instructions.size - 1))
    #@instructions = left_values.concat(right_values)
    puts "#{@instructions}"
  end
end
