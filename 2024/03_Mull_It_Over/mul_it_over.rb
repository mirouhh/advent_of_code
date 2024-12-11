require_relative 'lib/processor'

result = 0
extended_result = 0

File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  Processor.scan(line)
  Processor.scan_extended(line)
  result += Processor.process
  extended_result += Processor.process_extended
end

puts "The result is: #{result}"
puts "The extended result is: #{extended_result}"
