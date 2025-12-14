# frozen_string_literal: true

class MaxVoltageAggregator

  @@battery_banks = []

  def self.import_battery_bank(battery_bank)
    @@battery_banks << battery_bank
  end

  def self.battery_banks
    return @@battery_banks
  end

  def self.reset
    @@battery_banks.clear
  end

  def self.max_battery_index(battery_bank)
    battery_bank.chars.index(max_battery_voltage(battery_bank))
  end

  def self.max_battery_voltage(battery_bank)
    battery_bank.chars.max
  end

  def self.sum
    @@battery_banks.sum { |battery_bank| battery_bank.max_voltage }
  end
end
