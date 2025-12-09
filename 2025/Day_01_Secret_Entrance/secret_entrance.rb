start_position = 50
current_position = start_position

puts start_position == 50 ? "✓ Test 1 passed" : "✗ Test 1 FAILED: expected 50, was #{start_position}"
puts current_position == 50 ? "✓ Test 2 passed" : "✗ Test 2 FAILED: expected 50, was #{start_position}"

current_position -= 1

puts current_position == 49 ? "✓ Test 3 passed" : "✗ Test 3 FAILED: expected 49, was #{start_position}"
