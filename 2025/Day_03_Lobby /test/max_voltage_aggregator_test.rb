require 'minitest/autorun'
require_relative '../lib/max_voltage_aggregator'

class MaxVoltageAggregatorTest < Minitest::Test

  def test_import_battery_bank
    battery_bank = "12345"
    MaxVoltageAggregator.import_battery(battery_bank)
    assert_equal false, MaxVoltageAggregator.battery_banks.empty?
  end

  def test_reset_battery_banks
    battery_bank = "12345"
    MaxVoltageAggregator.import_battery(battery_bank)
    MaxVoltageAggregator.reset
    assert MaxVoltageAggregator.battery_banks.empty?
  end

  def test_max_battery_index
    battery_bank = "12345"
    max_battery_index = MaxVoltageAggregator.max_battery_index(battery_bank)
    assert_equal 4, max_battery_index
  end

  def test_max_battery_voltage
    battery_bank = "12345"
    max_battery_voltage = MaxVoltageAggregator.max_battery_voltage(battery_bank)
    assert_equal "5", max_battery_voltage
  end

end
