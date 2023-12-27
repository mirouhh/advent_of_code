# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/aoc23/value_calculator'

class ValueCalculatorTest < Minitest::Test
  def test_calculates_0_on_empty_string
    assert_equal 0, ''.int_array.value
  end

  def test_calculates_0_on_string_without_integers
    assert_equal 0, 'abc'.int_array.value
  end

  def test_calculates_0_if_string_contains_0
    assert_equal 0, 'a0bc'.int_array.value
  end

  def test_calculates_1_if_string_contains_10
    assert_equal 10, '10'.int_array.value
  end

  def test_calucate_values_for_1st_sample_data
    assert_equal 12, '1abc2'.int_array.value
    assert_equal 38, 'pqr3stu8vwx'.int_array.value
    assert_equal 15, 'a1b2c3d4e5f'.int_array.value
    assert_equal 77, 'treb7uchet'.int_array.value
  end

  def test_calculate_values_for_2nd_sample_data
      assert_equal 29, 'two1nine'.int_array.value
      assert_equal 83, 'eightwothree'.int_array.value
      assert_equal 13, 'abcone2threexyz'.int_array.value
      assert_equal 24, 'xtwone3four'.int_array.value
      assert_equal 42, '4nineeightseven2'.int_array.value
      assert_equal 14, 'zoneight234'.int_array.value
      assert_equal 76, '7pqrstsixteen'.int_array.value
  end

  def test_calculate_total_value_of_2nd_sample_data
    value_calculator = ValueCalculator.new
    value_calculator.add_value('two1nine')
    value_calculator.add_value('eightwothree')
    value_calculator.add_value('abcone2threexyz')
    value_calculator.add_value('xtwone3four')
    value_calculator.add_value('4nineeightseven2')
    value_calculator.add_value('zoneight234')
    value_calculator.add_value('7pqrstsixteen')
    assert_equal 281, value_calculator.sum
  end

  def test_calculate_total_value_of_1st_sample_data
    value_calculator = ValueCalculator.new
    value_calculator.add_value('1abc2')
    value_calculator.add_value('pqr3stu8vwx')
    value_calculator.add_value('a1b2c3d4e5f')
    value_calculator.add_value('treb7uchet')
    assert_equal 142, value_calculator.sum
  end

  def test_calculate_total_value_is_0_if_value_calculator_contains_no_data
    value_calculator = ValueCalculator.new
    assert_equal 0, value_calculator.sum
  end

end
