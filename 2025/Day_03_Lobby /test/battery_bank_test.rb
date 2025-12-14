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
    assert_equal "12345", battery_bank.batteries
  end

end