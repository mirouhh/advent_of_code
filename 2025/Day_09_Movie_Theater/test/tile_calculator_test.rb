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

  def test_calculator_can_calculate_rectangles
    assert_empty @tile_calculator
    @tile_calculator.add_red_tile(2,5)
    @tile_calculator.add_red_tile(9,7)
    @tile_calculator.calculate_rectangles
    refute_empty @tile_calculator.rectangles
  end

  def test_calculation_produces_the_correct_number_of_rectangles
    @tile_calculator.add_red_tile(2,5)
    @tile_calculator.add_red_tile(9,7)
    @tile_calculator.calculate_rectangles
    assert_equal 1, @tile_calculator.rectangles.size
  end

  def test_calculation_is_correct
    @tile_calculator.add_red_tile(2,5)
    @tile_calculator.add_red_tile(9,7)
    @tile_calculator.calculate_rectangles
    assert_equal 24, @tile_calculator.rectangles.first
  end

  def test_max_area
    @tile_calculator.add_red_tile(2,5)
    @tile_calculator.add_red_tile(9,7)
    @tile_calculator.add_red_tile(7,1)
    @tile_calculator.add_red_tile(11,7)
    @tile_calculator.calculate_rectangles
    assert_equal 35, @tile_calculator.max
  end

  def test_sample_data_is_calculated_correctly
    file = "#{File.dirname(__FILE__)}/../sample_input.txt"
    @tile_calculator.import(file)
    @tile_calculator.calculate_rectangles
    assert_equal 50, @tile_calculator.max
  end

  def test_no_green_tiles_without_red_tiles
    @tile_calculator.add_green_tiles
    assert_empty @tile_calculator.green_tiles
  end

  def test_green_tiles_are_calculated_in_the_same_row
    @tile_calculator.add_red_tile(7,1)
    @tile_calculator.add_red_tile(11, 1)
    @tile_calculator.add_green_tiles
    refute_empty @tile_calculator.green_tiles
  end

  def test_correct_amount_of_green_tiles_are_calculated_in_the_same_row
    @tile_calculator.add_red_tile(7,1)
    @tile_calculator.add_red_tile(11, 1)
    @tile_calculator.add_green_tiles
    assert_equal 3, @tile_calculator.green_tiles.size
  end

  def test_green_tiles_are_calculated_in_the_same_column
    @tile_calculator.add_red_tile(11,1)
    @tile_calculator.add_red_tile(11, 7)
    @tile_calculator.add_green_tiles
    refute_empty @tile_calculator.green_tiles
  end

  def test_correct_amount_of_green_tiles_are_calculated_in_the_same_column
    @tile_calculator.add_red_tile(11,1)
    @tile_calculator.add_red_tile(11, 7)
    @tile_calculator.add_green_tiles
    assert_equal 5, @tile_calculator.green_tiles.size
  end

  def test_green_tiles_are_calculated_across_rows_and_columns
    @tile_calculator.add_red_tile(7,1)
    @tile_calculator.add_red_tile(11,1)
    @tile_calculator.add_red_tile(11, 7)
    @tile_calculator.add_green_tiles
    refute_empty @tile_calculator.green_tiles
  end

  def test_correct_amount_of_green_tiles_are_calculated_across_rows_and_columns
    @tile_calculator.add_red_tile(7,1)
    @tile_calculator.add_red_tile(11,1)
    @tile_calculator.add_red_tile(11, 7)
    @tile_calculator.add_green_tiles
    assert_equal 8, @tile_calculator.green_tiles.size
  end

  def test_area_is_valid
    assert_empty @tile_calculator.valid_areas
    file = "#{File.dirname(__FILE__)}/../sample_input.txt"
    @tile_calculator.import(file)
    @tile_calculator.add_green_tiles
    first_red_tile = @tile_calculator.red_tiles[7]
    second_red_tile = @tile_calculator.red_tiles[1]
    assert @tile_calculator.valid?(first_red_tile, second_red_tile)
  end
end
