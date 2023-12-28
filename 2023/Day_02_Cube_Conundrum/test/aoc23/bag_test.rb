require 'minitest/autorun'
require_relative '../../lib/aoc23/bag'

class BagTest < Minitest::Test
  def test_new_bag_is_empty
    bag = Bag.new

    assert bag.empty?
  end

  def test_can_add_cubes
    bag = Bag.new
    bag.add_cube('blue')

    assert bag.contains? 'blue'
  end

  def test_can_count_amount_of_blue_cubes
    bag = Bag.new
    3.times { bag.add_cube('blue') }

    assert_equal 3, bag.count_cubes('blue')
  end

  def test_return_0_if_bag_does_not_contain_cube
    bag = Bag.new

    assert_equal 0, bag.count_cubes('blue')
  end
end
