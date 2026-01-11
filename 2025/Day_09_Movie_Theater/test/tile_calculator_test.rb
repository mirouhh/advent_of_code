require 'minitest/autorun'
require_relative '../lib/tile_calculator'

class TileCalculatorTest < Minitest::Test

  def test_new_calculator_is_empty
    tile_calculator = TileCalculator.new
    assert_empty tile_calculator
  end

  def test_calculator_can_add_red_tiles
    tile_calculator = TileCalculator.new
    tile_calculator.add_red_tile(1,2)
    refute_empty tile_calculator
  end
end
