class BatteryBank

  attr_reader :batteries
  def initialize(batteries="")
    @batteries = batteries.chars
  end

  def empty?
    @batteries.empty?
  end

  def max_index
    @batteries.index(@batteries.max)
  end

  def to_s
    @batteries.join
  end
end
