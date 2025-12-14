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

    lower_part = @batteries[0..(@batteries.length - 2)]
    first_max = lower_part.max
    first_max_index = lower_part.index(first_max)

    higher_part = @batteries[(first_max_index + 1)..-1]
    second_max = higher_part.max
    second_max_index = first_max_index + 1 + higher_part.index(second_max)

    [first_max_index, second_max_index]
  end

  def max_voltage
    @batteries.max.to_i
  end

  def to_s
    @batteries.join
  end
end
