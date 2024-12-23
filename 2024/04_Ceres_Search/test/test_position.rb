require 'minitest/autorun'
require_relative '../lib/position'

class TestArray < Minitest::Test

  def test_x_is_correct
    position = Position.new(0,0)
    assert_equal 0, position.x
  end

  def test_y_is_correct
    position = Position.new(0,0)
    assert_equal 0, position.y
  end

  def test_x_can_be_modified
    position = Position.new(0,0)
    position.x = 1
    assert_equal 1, position.x
  end

  def test_y_can_be_modified
    position = Position.new(0,0)
    position.y = 2
    assert_equal 2, position.y
  end

end