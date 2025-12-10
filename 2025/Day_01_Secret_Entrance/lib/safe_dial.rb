class SafeDial

  attr_reader :current_position, :start_position

  def initialize(start_position)
    @start_position = start_position
    @current_position = @start_position
  end

  def rotate(direction, steps)
    case direction
    when "L"
      @current_position -= steps
    when "R"
      @current_position += steps
    end
  end

end
