require 'minitest/autorun'

class TileCalculatorTest < Minitest::Test

  def test_new_calculator_is_empty
    tile_calculator = TileCalculator.new
    assert tile_calculator.empty?
  end
end
