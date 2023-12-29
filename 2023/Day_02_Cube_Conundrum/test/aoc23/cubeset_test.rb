require 'minitest/autorun'
require_relative '../../lib/aoc23/cube_set'

class CubeSetTest < Minitest::Test

  def setup
    @cube_set = CubeSet.new
  end

  def test_new_cubeset_has_no_cubes
    assert @cube_set.empty?
  end

  def test_contains_new_cubes
    assert_equal 0, @cube_set.total
    assert_equal 0, @cube_set.how_many('blue')
    @cube_set.add_cubes('blue', 2)
    assert_equal false, @cube_set.empty?
    assert_equal 2, @cube_set.how_many('blue')
    assert_equal 2, @cube_set.total
  end

  def test_contains_the_right_amount_of_cubes
    @cube_set.add_cubes('blue', 2)
    @cube_set.add_cubes('red', 3)
    assert_equal 5, @cube_set.total
  end

  def test_contains_the_right_cubes
    assert @cube_set.empty?
    @cube_set.add_cubes('blue', 2)
    assert @cube_set.contains?('blue')
  end

  def test_contains_the_right_amount_of_new_added_cubes
    assert @cube_set.empty?
    @cube_set.add_cubes('blue', 2)
    assert_equal 2, @cube_set.how_many('blue')
  end
end