class BatteryBank

  attr_reader :batteries
  def initialize(batteries="")
    @batteries = batteries.chars
  end

  def empty?
    @batteries.empty?
  end

  def max_index(amount=1)
    return @batteries.index(@batteries.max) if amount == 1
    indices = []
    max = @batteries[0..(@batteries.length-2)].max
    max_index = @batteries.index(max)
    indices << max_index
    second_part_of_batteries = @batteries[(max_index+1)..-1]
    second_max = second_part_of_batteries.max
    second_max_index = max_index + 1 + second_part_of_batteries.index(second_max)
    indices << second_max_index
  end

  def max_voltage
    @batteries.max.to_i
  end

  def to_s
    @batteries.join
  end
end
