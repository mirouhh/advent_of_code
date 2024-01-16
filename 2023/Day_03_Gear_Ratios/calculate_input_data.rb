require_relative 'lib/aoc23/part_number_detector'
require_relative 'lib/aoc23/part_number_candidate'
require_relative 'lib/aoc23/engine_schematic_symbol'

part_number_detector = PartNumberDetector.new
File.readlines(File.dirname(__FILE__) + '/input.txt').each do |line|
  part_number_detector.import_line line.chomp
end

part_number_detector.process_data

uniq_symbols = []
part_number_detector.symbols.each do |symbol|
  uniq_symbols << symbol.value
end

uniq_symbols = uniq_symbols.uniq

puts "\n### Part I ###" + ('#'* 106)
puts "#{part_number_detector.lines_read} lines imported"
puts "\n--- Symbols ---" + ('-'* 106)
puts "Symbols found: #{part_number_detector.symbols.length}"
part_number_detector.symbols.each_index { |index| puts "#{index}: #{part_number_detector.symbols[index].to_s}" }
puts "\n--- Part Numbers ---" + ('-'* 106)
puts "Part Numbers found: #{part_number_detector.part_numbers.length}"
part_number_detector.part_numbers.each_index { |index| puts "#{index}: #{part_number_detector.part_numbers[index].to_s}" }
puts "\n--- Invalid Numbers ---" + ('-'* 106)
puts "Invalid numbers found: #{part_number_detector.numbers.length}"
part_number_detector.numbers.each_index { |index| puts "#{index}: #{part_number_detector.numbers[index].to_s}" }
puts "The total sum of the valid part numbers is #{part_number_detector.sum}"
