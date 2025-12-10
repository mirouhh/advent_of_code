class SafeDial

  attr_reader :position, :zero_count
  attr_writer :instructions

  def initialize(start_position = 50)
    @position = start_position
    @dial_size = 100
    @zero_count = 0
    @zeros_passed = 0
  end

  def rotate(direction, steps)
    @zeros_passed += count_zeros_during_rotation(direction, steps)

    case direction
    when "L"
      @position = (@position - steps) % @dial_size
    when "R"
      @position = (@position + steps) % @dial_size
    end

    @zero_count += 1 if @position == 0
  end

  def dial
    @instructions.each do |intstruction|
      rotate(intstruction[0], intstruction[1..].to_i)
    end
  end

  def count_zeros_during_rotation(direction, steps)
    return 0 if steps == 0

    if direction == "L"
      first_zero = @position > 0 ? @position : @dial_size
    else
      first_zero = (@dial_size - @position) % @dial_size
      first_zero = @dial_size if first_zero == 0
    end

    return 0 if first_zero > steps

    (steps - first_zero) / @dial_size + 1
  end

  def zeros
    @zero_count + @zeros_passed
  end
end
