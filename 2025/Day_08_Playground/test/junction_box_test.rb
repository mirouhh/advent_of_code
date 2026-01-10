require 'minitest/autorun'
require_relative '../lib/helper'

class JunctionBoxTest < Minitest::Test

  def setup
    @junction_box = JunctionBox.new(0, 0, 0)
  end

  def test_default_values_are_zero
    assert_equal 0, @junction_box.x
    assert_equal 0, @junction_box.y
    assert_equal 0, @junction_box.z
  end

  def test_junction_box_has_correct_values
    junction_box = JunctionBox.new(1, 2, 3)
    assert_equal 1, junction_box.x
    assert_equal 2, junction_box.y
    assert_equal 3, junction_box.z
  end

end