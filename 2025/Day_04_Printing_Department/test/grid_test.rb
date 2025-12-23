require 'minitest/autorun'
require_relative '../lib/grid'

class GridTest < Minitest::Test

  def test_grid_is_empty
    grid = Grid.new
    assert grid.empty?
  end

  def test_grid_can_add_shelf
    grid = Grid.new
    grid.add('..@@.@@@@.')
    assert_equal false, grid.empty?
  end

end
