require 'minitest/autorun'
require_relative '../../lib/aoc23/string'

class StringTest < Minitest::Test
  def test_empty_array_is_returned_when_string_does_not_contain_numbers
    assert ''.int_array.empty?
    assert_equal 3, 'a1b2c3'.int_array.length
  end

  def test_int_array_contains_correct_numbers
    assert_equal [], ''.int_array
    assert_equal ['1'], 'a1'.int_array
    assert_equal ['1', '2'], 'a1b2'.int_array
    assert_equal ['1', '2', '3'], 'a1b2c3'.int_array
  end
end
