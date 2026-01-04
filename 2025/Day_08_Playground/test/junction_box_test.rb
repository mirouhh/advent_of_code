require 'minitest/autorun'
require_relative '../lib/junction_box'

class JunctionBoxTest < Minitest::Test

  def test_new_junction_box_doesnt_have_nil_values
    junction_box = JunctionBox.new(1,2,3)
    refute_nil junction_box.x
    refute_nil junction_box.y
    refute_nil junction_box.z
  end

  def test_default_values_are_zero
    junction_box = JunctionBox.new
    assert_equal 0, junction_box.x
    assert_equal 0, junction_box.y
    assert_equal 0, junction_box.z
  end

  def test_junction_box_has_correct_values
    junction_box = JunctionBox.new(1,2,3)
    assert_equal 1, junction_box.x
    assert_equal 2, junction_box.y
    assert_equal 3, junction_box.z
  end

  def test_new_position
    junction_box = JunctionBox.new
    junction_box.position(5, 6, 7)
    assert_equal 5, junction_box.x
    assert_equal 6, junction_box.y
    assert_equal 7, junction_box.z
  end

end