require_relative 'lib/instruction_importer'
require_relative 'lib/cephalopod_calculator'

instructionImporter = InstructionImporter.new
cephalopodCalculator = CephalopodCalculator.new

sample_file = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_file = "#{File.dirname(__FILE__)}/input.txt"


puts "####### PART ONE ###############################"
puts "#### Importing and validating sample data ####"

instructionImporter.import(sample_file)

instructionImporter.instructions_part_one.each do |instruction |
  puts "#{instruction[0..-2].join(' ' + instruction[-1] + ' ')} = #{cephalopodCalculator.execute_instruction(instruction)}"
end

puts "The grand total of the sample data is #{cephalopodCalculator.grand_total}."

puts "\n\n"
puts "#### Importing and validating puzzle data ####"

instructionImporter.reset
cephalopodCalculator.reset

instructionImporter.import(puzzle_file)

instructionImporter.instructions_part_one.each do |instruction |
  puts "#{instruction[0..-2].join(' ' + instruction[-1] + ' ')} = #{cephalopodCalculator.execute_instruction(instruction)}"
end

puts "The grand total of the puzzle data is #{cephalopodCalculator.grand_total}."
