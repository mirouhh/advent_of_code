require_relative 'lib/helper'
require_relative 'lib/circuit_calculator'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"

puts "####### PART ONE & TWO ###############################"
puts "#### Importing sample diagram ########################"

@circuitCalculator = CircuitCalculator.new
@circuitCalculator.import(sample_data)

puts "\n"
puts "#{@circuitCalculator.distances.size} distances found:"
@circuitCalculator.distances.sort_by { | distance | distance.value }.each_with_index do |distance, index |
  puts "Position #{index}: #{distance.value}, Start: #{distance.start} End: #{distance.end}"
end
puts "\n"
