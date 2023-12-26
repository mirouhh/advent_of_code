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

  def test_calucate_sample_data_for_each_given_string
    assert_equal 12, '1abc2'.int_array.value
    assert_equal 38, 'pqr3stu8vwx'.int_array.value
    assert_equal 15, 'a1b2c3d4e5f'.int_array.value
    assert_equal 77, 'treb7uchet'.int_array.value
  end

  def test_calculate_total_value_with_sample_data_is_142
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
