require 'minitest/autorun'
require_relative '../lib/calculator'

class CalculatorTest < Minitest::Test

  def test_calculator_is_empty
    calculator = Calculator.new
    assert calculator.empty?
  end

end
