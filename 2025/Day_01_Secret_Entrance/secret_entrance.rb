start_position = 50
@current_position = start_position

def rotate_left(distance)
  @current_position -= distance
end

def rotate_right(distance)
  @current_position += distance
end

## Test correct start position
puts start_position == 50 ? "✓ Test 1 passed" : "✗ Test 1 FAILED: expected 50, was #{start_position}"

## Test that current position equals start position in the very beginning
puts @current_position == 50 ? "✓ Test 2 passed" : "✗ Test 2 FAILED: expected 50, was #{@current_position}"

## Test that current position equals is updated correctly when rotating 1 step to the left
rotate_left(1)

puts @current_position == 49 ? "✓ Test 3 passed" : "✗ Test 3 FAILED: expected 49, was #{@current_position}"

## Test that current position equals is updated correctly when rotating 1 step to the right
rotate_right(1)

puts @current_position == 50 ? "✓ Test 4 passed" : "✗ Test 4 FAILED: expected 50, was #{@current_position}"

## Test that current position equals is updated correctly when rotating 13 steps to the left
rotate_left(13)

puts @current_position == 37 ? "✓ Test 5 passed" : "✗ Test 5 FAILED: expected 37, was #{@current_position}"

## Test that current position equals is updated correctly when rotating 40 steps to the right
rotate_right(40)
puts @current_position == 77 ? "✓ Test 6 passed" : "✗ Test 6 FAILED: expected 77, was #{@current_position}"