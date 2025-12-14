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

end
