require 'minitest/autorun'
require_relative '../../lib/aoc23/array'

class ArrayTest < Minitest::Test
  def test_value_is_0_when_array_is_empty
    assert_equal 0, [].value
  end

  def test_value_is_calculated_correctly
    assert_equal 0, ['0'].value
    assert_equal 1, ['0', '1'].value
    assert_equal 10, ['1', '0'].value
    assert_equal 11, ['1','1','1'].value
  end

end
