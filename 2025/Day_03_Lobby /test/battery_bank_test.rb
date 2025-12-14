require 'minitest/autorun'
require_relative '../lib/battery_bank'

class BatteryBankTest < Minitest::Test

  def test_battery_bank_is_empty
    battery_bank = BatteryBank.new
    assert battery_bank.empty?
  end

end