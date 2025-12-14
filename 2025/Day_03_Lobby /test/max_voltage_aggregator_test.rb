require 'minitest/autorun'
require_relative '../lib/max_voltage_aggregator'
require_relative '../lib/battery_bank'

class MaxVoltageAggregatorTest < Minitest::Test

  def setup
    MaxVoltageAggregator.reset
  end
  def test_import_battery_bank
    battery_bank = BatteryBank.new("12345")
    battery_bank.locate_max
    MaxVoltageAggregator.import_battery_bank(battery_bank)
    assert_equal false, MaxVoltageAggregator.battery_banks.empty?
  end

  def test_reset_battery_banks
    battery_bank = BatteryBank.new("12345")
    battery_bank.locate_max
    MaxVoltageAggregator.import_battery_bank(battery_bank)
    MaxVoltageAggregator.reset
    assert MaxVoltageAggregator.battery_banks.empty?
  end

  def test_max_battery_index
    battery_bank = BatteryBank.new("12345")
    battery_bank.locate_max
    MaxVoltageAggregator.import_battery_bank(battery_bank)
    max_battery_index = MaxVoltageAggregator.battery_banks[0].max_index
    assert_equal 4, max_battery_index
  end

  def test_max_battery_voltage
    battery_bank = BatteryBank.new("12345")
    battery_bank.locate_max
    MaxVoltageAggregator.import_battery_bank(battery_bank)
    max_battery_voltage = MaxVoltageAggregator.battery_banks[0].max_voltage
    assert_equal 5, max_battery_voltage
  end

  def test_aggregating_max_voltage
    sample_battery_bank_01 = BatteryBank.new("987654321111111")
    sample_battery_bank_01.locate_max(2)
    sample_battery_bank_02 = BatteryBank.new("811111111111119")
    sample_battery_bank_02.locate_max(2)

    MaxVoltageAggregator.import_battery_bank(sample_battery_bank_01)
    MaxVoltageAggregator.import_battery_bank(sample_battery_bank_02)

    expected_max_voltage_01 = 98
    expected_max_voltage_02 = 89

    assert_equal (expected_max_voltage_01 + expected_max_voltage_02), MaxVoltageAggregator.sum
  end
end
