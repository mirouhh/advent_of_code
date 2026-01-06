require 'minitest/autorun'
require_relative '../lib/circuit_calculator'
require_relative '../lib/junction_box'

class CircuitCalculatorTest < Minitest::Test

  def setup
    @circuit_calculator = CircuitCalculator.new
  end

  def test_circuit_calculator_is_empty
    assert @circuit_calculator.empty?
  end

  def test_circuit_calculator_can_add_junction_boxes
    junction_box_one = JunctionBox.new(162,817,812)
    junction_box_two = JunctionBox.new(57,618,57)
    @circuit_calculator.add(junction_box_one)
    @circuit_calculator.add(junction_box_two)
    assert_equal 2, @circuit_calculator.circuits.size
  end

  def test_circuit_calculator_calculates_distance_between_junction_boxes
    junction_box_one = JunctionBox.new
    junction_box_two = JunctionBox.new(3,4,12)
    assert_equal 13, @circuit_calculator.distance(junction_box_one, junction_box_two)
  end

  def test_circuit_calculator_calculates_all_distances
    junction_box_one = JunctionBox.new
    junction_box_two = JunctionBox.new(3,4,12)
    junction_box_three = JunctionBox.new(6,8,0)
    junction_box_four = JunctionBox.new(1,2,3)
    junction_box_five = JunctionBox.new(3,5,9)
    @circuit_calculator.add(junction_box_one)
    @circuit_calculator.add(junction_box_two)
    @circuit_calculator.add(junction_box_three)
    @circuit_calculator.add(junction_box_four)
    @circuit_calculator.add(junction_box_five)
    refute_empty @circuit_calculator.distances
  end
end
