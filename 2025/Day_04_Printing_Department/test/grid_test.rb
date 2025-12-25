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

  def test_find_one_adjacent_paper_roll
    @grid.add('..@@.@@.')
    paper_roll = [0, 2]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 1, adjacent_paper_rolls.size
  end

  def test_find_two_adjacent_paper_rolls
    @grid.add('..@@@.@.')
    paper_roll = [0, 3]
    adjacent_paper_rolls = @grid.adjacent_paper_rolls(paper_roll)
    assert_equal 2, adjacent_paper_rolls.size
  end

end
