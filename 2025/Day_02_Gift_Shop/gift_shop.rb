require_relative 'lib/id_validator'

sum = 0
ranges = File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true)[0].split(",")
ranges.each do |range|
  IDValidator.validate(range)
  puts "Invalid IDs in range #{range}: #{IDValidator.invalid_ids.to_s}" unless IDValidator.invalid_ids.empty?
  sum += IDValidator.sum unless IDValidator.invalid_ids.empty?
end
puts "All invalid IDs are sumed up to: #{sum}"
