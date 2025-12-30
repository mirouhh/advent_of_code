require 'minitest/autorun'
require_relative '../lib/cephalopod_calculator'

class CephalopodCalculatorTest < Minitest::Test

  def test_sum_with_single_operand
    cephalopodCalculator = CephalopodCalculator.new
    assert_equal 1, cephalopodCalculator.calculate('1', '+')
  end

end