require 'minitest/autorun'
require_relative '../lib/circuit_calculator'
require_relative '../lib/helper'

class CircuitCalculatorTest < Minitest::Test

  def setup
    @circuit_calculator = CircuitCalculator.new
    @circuit_calculator_with_imorted_data = CircuitCalculator.new
    @file = "#{File.dirname(__FILE__)}/../sample_input.txt"
    @circuit_calculator_with_imorted_data.import(@file)
  end

  def test_circuit_calculator_is_empty
    assert @circuit_calculator.empty?
  end

  def test_circuit_calculator_can_add_junction_boxes
    junction_box_one = JunctionBox.new(162,817,812)
    junction_box_two = JunctionBox.new(57,618,57)
    @circuit_calculator.add(junction_box_one)
    @circuit_calculator.add(junction_box_two)
    assert_equal 2, @circuit_calculator.junction_boxes.size
  end

  def test_circuit_calculator_calculates_distance_between_junction_boxes
    junction_box_one = JunctionBox.new(0, 0, 0)
    junction_box_two = JunctionBox.new(3,4,12)
    assert_equal 13, @circuit_calculator.distance(junction_box_one, junction_box_two)
  end

  def test_circuit_calculator_calculates_all_distances
    junction_box_one = JunctionBox.new(0, 0, 0)
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
    assert_equal 10, @circuit_calculator.distances.size
  end

  def test_distances_have_end_junction_boxes
    junction_box_one = JunctionBox.new(0, 0, 0)
    junction_box_two = JunctionBox.new(3,4,12)
    @circuit_calculator.add(junction_box_one)
    @circuit_calculator.add(junction_box_two)
    first_distance = @circuit_calculator.distances.first
    assert_equal junction_box_one, first_distance.start
    assert_equal junction_box_two, first_distance.end
  end

  def test_calculator_imports_data_from_file
    assert @circuit_calculator.empty?
    @circuit_calculator.import(@file)
    refute @circuit_calculator.empty?
  end

  def test_connect_boxes
    @circuit_calculator_with_imorted_data.connect_boxes(10)
    refute @circuit_calculator_with_imorted_data.circuits.empty?
  end

  def test_connecting_boxes_finds_all_circuits
    @circuit_calculator_with_imorted_data.connect_boxes(10)
    assert_equal 11, @circuit_calculator_with_imorted_data.circuits.size
  end

  def test_connecting_boxes_finds_correct_circuits
    @circuit_calculator_with_imorted_data.connect_boxes(10)
    top_3_circuits = @circuit_calculator_with_imorted_data.circuits.first(3)
    assert_equal 5, top_3_circuits.first.size
    assert_equal 4, top_3_circuits[1].size
    assert_equal 2, top_3_circuits.last.size
  end

  def test_circuit_calculator_multiplies_largest_circuits_correctly
    @circuit_calculator_with_imorted_data.connect_boxes(10)
    assert_equal 40, @circuit_calculator_with_imorted_data.multiply(3)
  end

  def test_connect_all_results_in_single_circuit
    @circuit_calculator_with_imorted_data.connect_all
    assert_equal 1, @circuit_calculator_with_imorted_data.circuits.size
    assert_equal @circuit_calculator_with_imorted_data.junction_boxes.size, @circuit_calculator_with_imorted_data.circuits.first.size
  end

end
