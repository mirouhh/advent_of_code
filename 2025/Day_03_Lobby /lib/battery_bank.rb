class BatteryBank

  attr_reader :batteries
  def initialize(batteries="")
    @batteries = batteries
  end

  def empty?
    @batteries.empty?
  end
end
