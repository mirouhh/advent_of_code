require 'minitest/autorun'
require_relative '../lib/cephalopod_calculator'

class CephalopodCalculatorTest < Minitest::Test

  def setup
    @cephalopodCalculator = CephalopodCalculator.new
  end

  def test_sum_with_single_operand
    assert_equal 1, @cephalopodCalculator.calculate('1', '+')
  end

  def test_sum_with_two_operands
    assert_equal 2, @cephalopodCalculator.calculate('1', '1', '+')
  end

  def test_sum_with_multiple_operands
    assert_equal 10, @cephalopodCalculator.calculate('1', '2', '3', '4', '+')
  end

  def test_mul_with_single_operand
    assert_equal 1, @cephalopodCalculator.calculate('1', '*')
  end

  def test_mul_with_multiple_operands
    assert_equal 6, @cephalopodCalculator.calculate('1', '2', '3', '*')
  end

  def test_calculate_grand_total
    @cephalopodCalculator.calculate('1', '2', '3', '4', '+')
    @cephalopodCalculator.calculate('1', '2', '3', '*')
    assert_equal 16, @cephalopodCalculator.grand_total
  end

end