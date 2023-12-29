require 'minitest/autorun'
require_relative '../../lib/aoc23/game'
require_relative '../../lib/aoc23/bag'
require_relative '../../lib/aoc23/Calculator'

class CalculatorTest < Minitest::Test

  def setup
    @game_1 = Game.create('Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green')
    @working_bag = Bag.new
    @working_bag.import('12 red, 13 green, 14 blue')

    @not_working_bag = Bag.new
    @not_working_bag.import('12 red, 13 green')
    @calculator = Calculator.new
  end

  def test_game_is_compatible_with_bag
    assert @calculator.compatible?(@game_1, @working_bag)
  end

  def test_all_colors_needed_are_available
    assert @calculator.has_all_colors_needed?(@game_1, @working_bag)
  end

  def test_not_all_colors_needed_are_available
    assert_equal false, @calculator.has_all_colors_needed?(@game_1, @not_working_bag)
    assert_equal "Game 1 is impossible as the bag doesn't contain any cube with the color blue", @calculator.error_msgs[0]
  end

  def test_enough_cubes_are_available
    assert @calculator.has_enough_cubes?(@game_1, @working_bag)
  end

  def test_not_enough_cubes_are_available
    assert_equal false, @calculator.has_enough_cubes?(@game_1, @not_working_bag)
    assert_equal "Game 1 is impossible as the game needs 3 blue cubes but the bag contains only 0", @calculator.error_msgs[0]
  end
end
