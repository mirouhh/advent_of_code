require 'minitest/autorun'
require_relative '../../lib/aoc23/cube_set'

class CubeSetTest < Minitest::Test

  def setup
    @cube_set = CubeSet.new
    @prefilled_cube_set = CubeSet.new
    @prefilled_cube_set.add_cubes('blue', 2)
    @prefilled_cube_set.add_cubes('red', 3)
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
    assert_equal 5, @prefilled_cube_set.total
  end

  def test_has_info
    assert_equal '2 blue, 3 red', @prefilled_cube_set.info
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
    @cube_set.add_cubes('blue', 1)
    assert_equal 3, @cube_set.how_many('blue')
  end

  def test_import_data_from_string
    assert @cube_set.empty?
    @cube_set.import('3 green, 4 blue, 1 red')
    assert_equal 8, @cube_set.total
    assert_equal 3, @cube_set.how_many('green')
    assert_equal 4, @cube_set.how_many('blue')
    assert_equal 1, @cube_set.how_many('red')
    assert_equal '3 green, 4 blue, 1 red', @cube_set.info
  end

  def test_update_cubes
    @prefilled_cube_set.update_cubes('red', 1)
    assert_equal 1, @prefilled_cube_set.how_many('red')
  end

  def test_set_min_cubes
    assert_equal 2, @prefilled_cube_set.how_many('blue')
    @prefilled_cube_set.min_cubes('blue', 4)
    assert_equal 4, @prefilled_cube_set.how_many('blue')
  end

  def test_power
    assert_equal 6, @prefilled_cube_set.power
  end
end
