require_relative 'lib/helper'
require_relative 'lib/circuit_calculator'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"

puts "####### PART ONE & TWO ###############################"
puts "#### Importing sample data ########################"
puts "\n"
circuit_calculator = CircuitCalculator.new
circuit_calculator.import(sample_data)
puts calculation_info(circuit_calculator, 10, 3)

