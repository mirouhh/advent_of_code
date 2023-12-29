require 'minitest/autorun'
require_relative '../../lib/aoc23/bag'

class BagTest < Minitest::Test

  def setup
    @bag = Bag.new
  end
  def test_new_bag_is_empty
    assert @bag.empty?
  end

  def test_can_add_cubes
    @bag.add_cube('blue')

    assert @bag.contains? 'blue'
  end

  def test_can_count_amount_of_blue_cubes
    3.times { @bag.add_cube('blue') }

    assert_equal 3, @bag.how_many('blue')
  end

  def test_return_0_if_bag_does_not_contain_cube
    assert_equal 0, @bag.how_many('blue')
  end

  def test_import_data
    assert @bag.empty?
    @bag.import('12 red, 13 green, 14 blue')
    assert_equal 12, @bag.how_many('red')
    assert_equal 13, @bag.how_many('green')
    assert_equal 14, @bag.how_many('blue')
  end
end
