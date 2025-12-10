@start_position = 50
@current_position = @start_position

def dial(instruction)
  direction = instruction[0]
  steps = instruction[1..instruction.length].to_i
  rotate(direction, steps)
end

def rotate(direction, steps)
  case direction
  when "L"
    @current_position -= steps
  when "R"
    @current_position += steps
  end
end
