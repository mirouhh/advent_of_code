require 'minitest/autorun'
require_relative '../../lib/aoc23/cube'

class CubeTest < Minitest::Test
  def test_has_white_as_default_color
    cube = Cube.new
    assert_equal 'White', cube.color
  end

  def test_has_color
    cube = Cube.new('blue')
    assert_equal 'Blue', cube.color
  end
end
