require_relative 'lib/id_validator'

sum = 0
puts "####### PART ONE ###############################"
puts "#### Validating and calculating sample data ####"
ranges = File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true)[0].split(",")
ranges.each do |range|
  IDValidator.validate(range)
  puts "Invalid IDs in range #{range}: #{IDValidator.invalid_ids}" unless IDValidator.invalid_ids.empty?
  sum += IDValidator.sum unless IDValidator.invalid_ids.empty?
end
puts "All invalid IDs are summed up to: #{sum}\n\n"

sum = 0
puts "#### Validating and calculating puzzle data ####"
ranges = File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true)[0].split(",")
ranges.each do |range|
  IDValidator.validate(range)
  puts "Invalid IDs in range #{range}: #{IDValidator.invalid_ids}" unless IDValidator.invalid_ids.empty?
  sum += IDValidator.sum unless IDValidator.invalid_ids.empty?
end
puts "All invalid IDs are summed up to: #{sum}\n\n"

sum = 0
puts "####### PART TWO ###############################"
puts "#### Validating and calculating sample data ####"
ranges = File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true)[0].split(",")
ranges.each do |range|
  IDValidator.validate_part_two(range)
  puts "Invalid IDs in range #{range}: #{IDValidator.invalid_ids_part_two}" unless IDValidator.invalid_ids_part_two.empty?
  sum += IDValidator.sum_part_two unless IDValidator.invalid_ids_part_two.empty?
end
puts "All invalid IDs are summed up to: #{sum}\n\n"
