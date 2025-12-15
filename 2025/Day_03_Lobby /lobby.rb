require_relative 'lib/battery_bank'
require_relative 'lib/max_voltage_aggregator'

puts "####### PART ONE    ###############################"
puts "####### Sample Data ###############################"
MaxVoltageAggregator.reset
File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true).each do |line|
  puts "Importing #{line}"
  battery_bank = BatteryBank.new(line)
  battery_bank.locate_max(2)
  MaxVoltageAggregator.import_battery_bank(battery_bank)
end

puts "The total maximum voltage produced by the sample data is #{MaxVoltageAggregator.sum}"

puts "####### PART ONE    ###############################"
puts "####### Puzzle Data ###############################"
MaxVoltageAggregator.reset
File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  puts "Importing #{line}"
  battery_bank = BatteryBank.new(line)
  battery_bank.locate_max(2)
  MaxVoltageAggregator.import_battery_bank(battery_bank)
end

puts "The total maximum voltage produced by the sample data is #{MaxVoltageAggregator.sum}"
