require_relative 'lib/id_validator'

ranges = File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true)[0].split(",")
ranges.each do |range|
  IDValidator.validate(range)
  puts "Invalid IDs in range #{range}: #{IDValidator.invalid_ids.to_s}"
end
