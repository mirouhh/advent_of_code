require 'minitest/autorun'
require_relative '../lib/calculator'
require_relative '../lib/machine'

class CalculatorTest < Minitest::Test

  def after_setup
    @calculator = Calculator.new
    @machine_one = Machine.new
    @machine_one.indicator_lights = '[.##.]'
    @machine_one.button_wiring_schematics = '(3) (1,3) (2) (2,3) (0,2) (0,1)'
    @machine_one.joltage_requirements = '{3,5,4,7}'
    @machine_two = Machine.new
    @machine_two.indicator_lights = '[...#.]'
    @machine_two.button_wiring_schematics = '(0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4)'
    @machine_two.joltage_requirements = '{7,5,12,7,2}'
  end

  def test_calculator_is_empty
    assert_empty @calculator
  end

  def test_calculator_can_import_machines
    @calculator.add(@machine_one)
    refute_empty @calculator
  end

  def test_calculator_can_calculate_fewest_button_presses
    assert_equal 2, @calculator.fewest_button_presses(@machine_one)
  end

  def test_calculator_can_sum_up_all_fewest_button_presses
    @calculator.add(@machine_one)
    @calculator.add(@machine_two)
    assert_equal 5, @calculator.sum.first
  end

  def test_calculator_should_be_able_to_import_data_from_file
    file = "#{File.dirname(__FILE__)}/../sample_input.txt"
    @calculator.import(file)
    assert_equal 7, @calculator.sum.first
    assert_equal 33, @calculator.sum.last
  end

  def test_calculator_can_calculate_fewest_button_presses_for_joltage_requirements
    assert_equal 10, @calculator.fewest_button_presses_for_joltage_requirements(@machine_one)
  end

  def test_calculator_can_sum_up_all_fewest_button_presses_for_joltage_requirements
    @calculator.add(@machine_one)
    @calculator.add(@machine_two)
    assert_equal 22, @calculator.sum.last
  end

end
