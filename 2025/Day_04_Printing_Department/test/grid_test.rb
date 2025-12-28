require 'minitest/autorun'
require_relative '../lib/grid'

class GridTest < Minitest::Test

  def setup
    @grid = Grid.new
  end

  def test_grid_is_empty
    assert @grid.empty?
  end

  def test_grid_can_add_shelf
    @grid.add('..@@.@@@@.')
    assert_equal false, @grid.empty?
  end

  def test_shelf_includes_paper_roll
    @grid.add('..@@.@@@@.')
    assert @grid.paper_roll?(0)
  end

  def test_shelf_includes_no_paper_roll
    @grid.add('..........')
    assert_equal false, @grid.paper_roll?(0)
  end

  def test_grid_could_be_cleared
    @grid.add('..@@.@@@@.')
    @grid.clear
    assert @grid.empty?
  end

  def test_one_paper_position_is_correct
    @grid.add('..@.......')
    assert_equal [2], @grid.paper_rolls(0)
  end

  def test_two_paper_positions_are_correct
    @grid.add('..@.....@.')
    assert_equal [2, 8], @grid.paper_rolls(0)
  end

  def test_paper_has_adjacent_paper_rolls
    @grid.add('..@@.@@.')
    paper_roll = [0, 2]
    assert @grid.adjacent_paper_rolls(paper_roll)
  end

  def test_find_one_adjacent_paper_roll_on_same_shelf
    @grid.add('..@@.@@.')
    paper_roll = [0, 2]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 1, adjacent_paper_rolls.size
  end

  def test_find_two_adjacent_paper_rolls_on_same_shelf
    @grid.add('..@@@.@.')
    paper_roll = [0, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 2, adjacent_paper_rolls.size
  end

  def test_find_one_adjacent_paper_roll_on_shelf_above
    @grid.add('..@.....')
    @grid.add('...@....')
    paper_roll = [1, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 1, adjacent_paper_rolls.size
  end

  def test_find_two_adjacent_paper_rolls_on_shelf_above
    @grid.add('..@.@...')
    @grid.add('...@....')
    paper_roll = [1, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 2, adjacent_paper_rolls.size
  end

  def test_find_three_adjacent_paper_rolls_on_shelf_above
    @grid.add('..@@@...')
    @grid.add('...@....')
    paper_roll = [1, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 3, adjacent_paper_rolls.size
  end

  def test_find_one_adjacent_paper_roll_on_shelf_below
    @grid.add('...@....')
    @grid.add('..@.....')
    paper_roll = [0, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 1, adjacent_paper_rolls.size
  end

  def test_find_two_adjacent_paper_rolls_on_shelf_below
    @grid.add('...@....')
    @grid.add('..@@....')
    paper_roll = [0, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 2, adjacent_paper_rolls.size
  end

  def test_find_three_adjacent_paper_rolls_on_shelf_below
    @grid.add('...@....')
    @grid.add('..@@@...')
    paper_roll = [0, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 3, adjacent_paper_rolls.size
  end

  def test_find_eight_adjacent_paper_rolls_across_shelfs
    @grid.add('..@@@...')
    @grid.add('..@@@...')
    @grid.add('..@@@...')
    paper_roll = [1, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 8, adjacent_paper_rolls.size
  end

  def test_check_unaccessability
    @grid.add('..@@@...')
    @grid.add('..@@@...')
    @grid.add('..@@@...')
    paper_roll = [1,3]
    assert_equal false, @grid.accessable?(paper_roll)
  end

  def test_check_accessability
    @grid.add('..@@@...')
    @grid.add('..@@@...')
    @grid.add('..@@@...')
    paper_roll = [0,2]
    assert @grid.accessable?(paper_roll)
  end

  def test_find_all_accessable_paper_rolls
    @grid.add('..@@.@@@@.')
    @grid.add('@@@.@.@.@@')
    @grid.add('@@@@@.@.@@')
    @grid.add('@.@@@@..@.')
    @grid.add('@@.@@@@.@@')
    @grid.add('.@@@@@@@.@')
    @grid.add('.@.@.@.@@@')
    @grid.add('@.@@@.@@@@')
    @grid.add('.@@@@@@@@.')
    @grid.add('@.@.@@@.@.')
    @grid.find_accessable_paper_rolls
    assert_equal 13, @grid.accessable_paper_rolls.size
  end

  def test_accessable_paper_rolls_can_be_picked_up
    @grid.add('..@@.@@@@.')
    @grid.add('@@@.@.@.@@')
    @grid.add('@@@@@.@.@@')
    @grid.add('@.@@@@..@.')
    @grid.add('@@.@@@@.@@')
    @grid.add('.@@@@@@@.@')
    @grid.add('.@.@.@.@@@')
    @grid.add('@.@@@.@@@@')
    @grid.add('.@@@@@@@@.')
    @grid.add('@.@.@@@.@.')
    @grid.find_accessable_paper_rolls
    @grid.pick_up_paper_rolls
    @grid.find_accessable_paper_rolls
    assert_equal 12, @grid.accessable_paper_rolls.size
  end

  def test_picked_up_paper_rolls
    @grid.add('..@@.@@@@.')
    @grid.add('@@@.@.@.@@')
    @grid.add('@@@@@.@.@@')
    @grid.add('@.@@@@..@.')
    @grid.add('@@.@@@@.@@')
    @grid.add('.@@@@@@@.@')
    @grid.add('.@.@.@.@@@')
    @grid.add('@.@@@.@@@@')
    @grid.add('.@@@@@@@@.')
    @grid.add('@.@.@@@.@.')
    @grid.find_accessable_paper_rolls
    @grid.pick_up_paper_rolls
    @grid.find_accessable_paper_rolls
    @grid.pick_up_paper_rolls
    assert_equal 25, @grid.picked_up_paper_rolls
  end
end
