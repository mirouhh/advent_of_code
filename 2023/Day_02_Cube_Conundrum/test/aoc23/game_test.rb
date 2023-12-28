require 'minitest/autorun'
require_relative '../../lib/aoc23/game'
require_relative '../../lib/aoc23/cube_set'

class GameTest < Minitest::Test
  def test_has_id
    game = Game.new(1)

    assert_equal 1, game.id
  end

  def test_has_empty_cube_sets
    game = Game.new(1)

    assert game.empty?
  end

  def test_has_cube_set
    set = CubeSet.new
    set.add_cubes('blue', 3)
    set.add_cubes('red', 4)

    game = Game.new(1)
    game.add_cube_set(set)

    assert_equal false, game.empty?
    assert_equal 'Game 1: 3 blue, 4 red', game.info
  end

  def test_has_cube_sets
    set_1 = CubeSet.new
    set_1.add_cubes('blue', 3)
    set_1.add_cubes('red', 4)

    set_2 = CubeSet.new
    set_2.add_cubes('red', 1)
    set_2.add_cubes('green', 2)
    set_2.add_cubes('blue', 6)

    set_3 = CubeSet.new
    set_3.add_cubes('green', 2)

    game = Game.new(1)
    game.add_cube_set(set_1)
    game.add_cube_set(set_2)
    game.add_cube_set(set_3)

    assert_equal false, game.empty?
    assert_equal 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green', game.info
  end

end
