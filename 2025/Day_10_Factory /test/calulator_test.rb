require 'minitest/autorun'
require_relative '../lib/calculator'

class CalulatorTest < Minitest::Test

  def test_calculator_is_empty
    calculator = Calculator.new
    assert calculator.empty?
  end

end
