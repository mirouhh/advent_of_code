class SafeDial

  attr_reader :current_position, :start_position, :zero_count

  def initialize(start_position)
    @start_position = start_position
    @current_position = @start_position
    @zero_count = 0
  end

  def rotate(direction, steps)
    case direction
    when "L"
      @current_position -= steps
    when "R"
      @current_position += steps
    end

    @zero_count += 1 if @current_position == 0
  end

end
