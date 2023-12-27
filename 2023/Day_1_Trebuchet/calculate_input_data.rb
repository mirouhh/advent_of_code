require_relative 'lib/aoc23/value_calculator'

value_calculator = ValueCalculator.new
lines_found = 0
File.readlines(File.dirname(__FILE__) + '/input.txt').each do |line|
  puts "Adding #{line.chomp}, value: #{line.int_array.value}"
  value_calculator.add_value(line)
  lines_found += 1
end

puts '#' * 80
puts "Lines found: #{lines_found}"
puts "The total sum of the lines in the input file is #{value_calculator.sum}"
