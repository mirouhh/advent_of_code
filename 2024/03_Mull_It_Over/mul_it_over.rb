require_relative 'lib/processor'

result = 0

File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  Processor.scan(line)
  result += Processor.process
end

puts "The result is: #{result}"
