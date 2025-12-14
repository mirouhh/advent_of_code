require 'minitest/autorun'
require_relative '../lib/max_voltage_aggregator'
require_relative '../lib/battery_bank'

class MaxVoltageAggregatorTest < Minitest::Test

  def setup
    battery_bank = BatteryBank.new("12345")
    battery_bank.locate_max
    MaxVoltageAggregator.import_battery_bank(battery_bank)
  end
  def test_import_battery_bank
    assert_equal false, MaxVoltageAggregator.battery_banks.empty?
  end

  def test_reset_battery_banks
    MaxVoltageAggregator.reset
    assert MaxVoltageAggregator.battery_banks.empty?
  end

  def test_max_battery_index
    max_battery_index = MaxVoltageAggregator.battery_banks[0].max_index
    assert_equal 4, max_battery_index
  end

  def test_max_battery_voltage
    max_battery_voltage = MaxVoltageAggregator.battery_banks[0].max_voltage
    assert_equal 5, max_battery_voltage
  end

end
