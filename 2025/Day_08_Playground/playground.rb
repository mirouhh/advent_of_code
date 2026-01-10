require_relative 'lib/helper'
require_relative 'lib/circuit_calculator'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"

puts "####### PART ONE & TWO ###############################"
puts "#### Importing sample data ###########################"
puts "\n"
circuit_calculator = CircuitCalculator.new
circuit_calculator.import(sample_data)
puts calculation_info_part_one(circuit_calculator, 10, 3)

puts calculation_info_part_two(circuit_calculator)

puts "#### Importing puzzle data ######################"
puts "\n"
circuit_calculator.clear
circuit_calculator.import(puzzle_data)
puts calculation_info_part_one(circuit_calculator, 1000, 3)

puts calculation_info_part_two(circuit_calculator)
