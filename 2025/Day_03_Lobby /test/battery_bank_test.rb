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
    battery_bank.locate_max
    assert_equal 5, battery_bank.max_voltage
  end

  def test_max_two_batteries
    battery_bank = BatteryBank.new("12345")
    battery_bank.locate_max(2)
    assert_equal [3, 4], battery_bank.selected_batteries
  end

  def test_max_voltage_for_two_batteries
    battery_bank = BatteryBank.new("12345")
    battery_bank.locate_max(2)
    assert_equal 45, battery_bank.max_voltage
  end

  def test_max_voltage_for_twelve_batteries_for_sample_case_one
    battery_bank = BatteryBank.new("987654321111111")
    battery_bank.locate_max(12)
    assert_equal 987654321111, battery_bank.max_voltage
  end

  def test_max_voltage_for_twelve_batteries_for_sample_case_two
    battery_bank = BatteryBank.new("811111111111119")
    battery_bank.locate_max(12)
    assert_equal 811111111119, battery_bank.max_voltage
  end

  def test_max_voltage_for_twelve_batteries_for_sample_case_three
    battery_bank = BatteryBank.new("234234234234278")
    battery_bank.locate_max(12)
    assert_equal 434234234278, battery_bank.max_voltage
  end

end