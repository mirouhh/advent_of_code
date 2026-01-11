require 'minitest/autorun'
require_relative '../lib/tile_calculator'

class TileCalculatorTest < Minitest::Test

  def setup
    @tile_calculator = TileCalculator.new
  end

  def test_new_calculator_is_empty
    assert_empty @tile_calculator
  end

  def test_calculator_can_add_red_tiles
    @tile_calculator.add_red_tile(1,2)
    refute_empty @tile_calculator
  end

  def test_calculator_can_be_cleaned
    assert_empty @tile_calculator
    @tile_calculator.add_red_tile(1,2)
    refute_empty @tile_calculator
    @tile_calculator.clean
    assert_empty @tile_calculator
  end

  def test_calculator_can_import_data_from_file
    file = "#{File.dirname(__FILE__)}/../sample_input.txt"
    assert_empty @tile_calculator
    @tile_calculator.import(file)
    refute_empty @tile_calculator
  end
end
