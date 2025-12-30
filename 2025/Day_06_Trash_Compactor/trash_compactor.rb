require_relative 'lib/cephalopod_calculator'

cephalopodCalculator = CephalopodCalculator.new

puts "####### PART ONE ###############################"
puts "#### Importing and validating sample data ####"

lines = File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true).reject(&:empty?)
instructions = lines[0..-2].map(&:split).transpose.zip(lines[-1].split).map(&:flatten)

instructions.each do |instruction |
  cephalopodCalculator.add_instruction
  puts "#{instruction[0..-2].join(' ' + instruction[-1] + ' ')} = #{cephalopodCalculator.execute_instruction(instruction)}"
end

puts "The grand total of the sample data is #{cephalopodCalculator.grand_total}."
