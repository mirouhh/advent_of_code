require 'minitest/autorun'
require_relative '../lib/circuit_calculator'
require_relative '../lib/junction_box'

class CircuitCalculatorTest < Minitest::Test

  def test_circuit_calculator_is_empty
    circuit_calculator = CircuitCalculator.new
    assert circuit_calculator.empty?
  end

  def test_circuit_can_add_junction_boxes
    circuit_calculator = CircuitCalculator.new
    junction_box_one = JunctionBox.new(162,817,812)
    junction_box_two = JunctionBox.new(57,618,57)
    circuit_calculator.add(junction_box_one)
    circuit_calculator.add(junction_box_two)
    assert_equal 2, circuit_calculator.circuits.size
  end

end
