require_relative 'lib/calculator'
require_relative 'lib/machine'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"

calculator = Calculator.new

puts "####### PART ONE & TWO ###############################"
puts "#### Importing sample data ###########################"

calculator.import(sample_data)
puts calculator

calculator.clear

puts "#### Importing puzzle data ###########################"

calculator.import(puzzle_data)
puts calculator
