require 'minitest/autorun'
require_relative '../lib/max_voltage_aggregator'

class MaxVoltageAggregatorTest < Minitest::Test

  def test_import_battery_bank
    battery_bank = "12345"
    MaxVoltageAggregator.import_battery(battery_bank)
    assert_equal false, MaxVoltageAggregator.battery_banks.empty?
  end

end
