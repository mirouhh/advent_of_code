require_relative 'lib/aoc23/part_number_detector'
require_relative 'lib/aoc23/part_number_candidate'
require_relative 'lib/aoc23/engine_schematic_symbol'

part_number_detector = PartNumberDetector.new
File.readlines(File.dirname(__FILE__) + '/input.txt').each do |line|
  part_number_detector.import_line line
end

part_number_detector.process_data

puts '### Part I ###' + ('#'* 106)
puts "#{part_number_detector.lines_read} lines imported"
puts "Symbols found: #{part_number_detector.symbols.length}"
puts "Part Numbers found: #{part_number_detector.part_numbers.length}"
puts "Invalid numbers found: #{part_number_detector.numbers.length}"
puts "The total sum of the valid part numbers is #{part_number_detector.sum}"
