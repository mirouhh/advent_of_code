require_relative 'lib/calculator'
require_relative 'lib/machine'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"

calculator = Calculator.new

puts "####### PART ONE #####################################"
puts "#### Importing sample data ###########################"

calculator.import(sample_data)
puts calculator
