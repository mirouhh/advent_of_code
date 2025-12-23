require 'minitest/autorun'
require_relative '../lib/grid'

class GridTest < Minitest::Test

  def test_grid_is_empty
    grid = Grid.new
    assert grid.empty?
  end

end
