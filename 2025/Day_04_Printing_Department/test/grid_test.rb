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
    assert_equal ['2'], @grid.paper_rolls(0)
  end

  def test_two_paper_positions_are_correct
    @grid.add('..@.....@.')
    assert_equal ['2', '8'], @grid.paper_rolls(0)
  end

end
