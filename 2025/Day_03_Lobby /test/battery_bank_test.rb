require 'minitest/autorun'
require_relative '../lib/battery_bank'

class BatteryBankTest < Minitest::Test

  def test_battery_bank_is_empty
    battery_bank = BatteryBank.new
    assert battery_bank.empty?
  end

  def test_battery_bank_with_batteries
    battery_bank = BatteryBank.new("12345")
    assert_equal false, battery_bank.empty?
    assert_equal "12345", battery_bank.to_s
  end

  def test_max_battery_index
    battery_bank = BatteryBank.new("12345")
    assert_equal 4, battery_bank.max_index
  end

  def test_max_voltage
    battery_bank = BatteryBank.new("12345")
    assert_equal 5, battery_bank.max_voltage
  end

  def test_max_two_batteries
    battery_bank = BatteryBank.new("12345")
    assert_equal [3, 4], battery_bank.max_index(2)
  end

  def test_max_voltage_for_two_batteries
    battery_bank = BatteryBank.new("12345")
    assert_equal 45, battery_bank.max_voltage(2)
  end

end