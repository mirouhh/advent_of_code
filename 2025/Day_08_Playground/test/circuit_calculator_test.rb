require 'minitest/autorun'
require_relative '../lib/circuit_calculator'

class CircuitCalculatorTest < Minitest::Test

  def test_circuit_calculator_is_empty
    circuit_calculator = CircuitCalculator.new
    assert circuit_calculator.empty?
  end

end
