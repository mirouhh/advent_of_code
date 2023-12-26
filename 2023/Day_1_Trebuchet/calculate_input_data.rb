require_relative 'lib/aoc23/value_calculator'

value_calculator = ValueCalculator.new

File.readlines(File.dirname(__FILE__) + '/input.txt').each do |line|
  puts "Adding #{line}"
  value_calculator.add_value(line)
end

puts '#' * 80
puts "The total sum of the line in the input file is #{value_calculator.sum}"
