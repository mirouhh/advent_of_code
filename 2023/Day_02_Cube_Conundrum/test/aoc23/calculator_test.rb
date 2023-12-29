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

  def test_detect_games_that_are_compatible
    game_2 = Game.create('Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue')
    game_3 = Game.create('Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red')
    game_4 = Game.create('Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red')
    game_5 = Game.create('Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green')

    games_to_check = [@game_1, game_2, game_3, game_4, game_5]
    @calculator.check(games_to_check, @working_bag)

    assert_equal [1, 2, 5], @calculator.possible_games
    assert_equal [3, 4], @calculator.impossible_games
  end

  def test_sum_up_possible_game_ids
    game_2 = Game.create('Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue')
    game_3 = Game.create('Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red')
    game_4 = Game.create('Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red')
    game_5 = Game.create('Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green')

    games_to_check = [@game_1, game_2, game_3, game_4, game_5]
    @calculator.check(games_to_check, @working_bag)

    assert_equal 8, @calculator.possible_games.sum
  end
end
