require_relative 'lib/battery_bank'
require_relative 'lib/max_voltage_aggregator'

sum = 0
puts "####### PART ONE ###############################"
MaxVoltageAggregator.reset
File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true).each do |line|
  puts "Importing #{line}"
  battery_bank = BatteryBank.new(line)
  battery_bank.locate_max(2)
  MaxVoltageAggregator.import_battery_bank(battery_bank)
end

puts "The total maximum voltage produced by the sample data is #{MaxVoltageAggregator.sum}"
