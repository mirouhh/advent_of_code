class BatteryBank

  attr_reader :batteries, :max_voltage, :selected_batteries
  def initialize(batteries="")
    @batteries = batteries.chars
    @selected_batteries = []
    @max_voltage = 0
  end

  def empty?
    @batteries.empty?
  end

  def max_index(amount=1)
    first_max_index = @batteries.index(@batteries.max)
    return first_max_index if amount == 1

    lower_part = @batteries[0..(@batteries.length - 2)]
    first_max_index = lower_part.index(lower_part.max)

    higher_part = @batteries[(first_max_index + 1)..-1]
    second_max_index = first_max_index + 1 + higher_part.index(higher_part.max)

    @selected_batteries << first_max_index
    @selected_batteries << second_max_index

  end

  def locate_max(amount=1)
    max_index(amount)
    calculate_max_voltage(amount)
  end

  def calculate_max_voltage(amount=1)
    case amount
    when 1
      return @max_voltage += @batteries.max.to_i
    when 2
      return @max_voltage += (@batteries[@selected_batteries[0]] + @batteries[@selected_batteries[1]]).to_i
    when 12
      calculate_max_voltage_for_twelve_batteries
    end
  end

  def calculate_max_voltage_for_twelve_batteries
    amount = 12
    current_pos = 0
    @selected_batteries = []
    @selected_batteries_values = []

    (0..(amount - 1)).each do |pos|
      remaining = amount - pos
      available = @batteries.length - current_pos
      search_area = available - remaining + 1

      slice = @batteries[current_pos..(current_pos + search_area - 1)]

      max_battery = slice.max
      max_position = current_pos + slice.index(max_battery)
      @selected_batteries << max_position
      @selected_batteries_values << max_battery
      current_pos += max_position + 1
    end

    @max_voltage = @selected_batteries_values.join.to_i
    
  end

  def to_s
    @batteries.join
  end
end
