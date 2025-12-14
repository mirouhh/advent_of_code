# frozen_string_literal: true

class MaxVoltageAggregator

  @@battery_banks = []

  def self.import_battery(battery)
    @@battery_banks << battery
  end

  def self.battery_banks
    return @@battery_banks
  end

  def self.reset
    @@battery_banks.clear
  end

  def self.max_battery_index(battery_bank)
    battery_bank.chars.index(battery_bank.chars.max)
  end

  def self.max_battery_voltage(battery_bank)
    battery_bank.chars.max
  end

end
