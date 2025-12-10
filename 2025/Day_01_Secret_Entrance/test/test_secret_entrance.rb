require 'minitest/autorun'
require_relative '../lib/safe_dial'

class SafedialTest < Minitest::Test

  def setup
    @self_dial = SafeDial.new(50)
  end

  def test_start_position_is_correct
    assert_equal(50, @self_dial.start_position)
  end

  def test_current_position_equals_start_initially
    assert_equal(@self_dial.start_position, @self_dial.current_position)
  end

  def test_safe_dial_rotates_left_one_step_correctly
    @self_dial.rotate("L", 1)
    assert_equal(49, @self_dial.current_position)
  end

  def test_safe_dial_rotates_right_one_step_correctly
    @self_dial.rotate("R", 1)
    assert_equal(51, @self_dial.current_position)
  end

  def test_safe_dial_rotates_left_multiple_step_correctly
    @self_dial.rotate("L", 13)
    assert_equal(37, @self_dial.current_position)
  end

  def test_safe_dial_rotates_right_multiple_step_correctly
    @self_dial.rotate("R", 40)
    assert_equal(90, @self_dial.current_position)
  end

  def test_safe_dial_rotates_both_directions_correctly
    @self_dial.rotate("L", 37)
    @self_dial.rotate("R", 40)
    assert_equal(53, @self_dial.current_position)
  end

  def test_safe_dial_counts_zeros_correctly
    @self_dial.rotate("L", 50)
    @self_dial.rotate("R", 13)
    @self_dial.rotate("L", 13)
    assert_equal(2, @self_dial.zero_count)
  end

  def test_safe_dial_can_rotate_multiple_times
    @self_dial.instructions = ["L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82"]
    @self_dial.dial
    assert_equal(3, @self_dial.zero_count)
  end
end
