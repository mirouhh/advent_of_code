class SafeDial

  attr_reader :position, :zero_count
  attr_writer :instructions

  def initialize(start_position)
    @position = start_position
    @dial_size = 100
    @zero_count = 0
  end

  def rotate(direction, steps)
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
end
