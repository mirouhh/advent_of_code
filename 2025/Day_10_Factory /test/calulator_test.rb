require 'minitest/autorun'
require_relative '../lib/calculator'
require_relative '../lib/machine'

class CalculatorTest < Minitest::Test

  def after_setup
    @calculator = Calculator.new
    @machine = Machine.new
    @machine.indicator_lights = '[.##.]'
    @machine.button_wiring_schematics = '(3) (1,3) (2) (2,3) (0,2) (0,1)'
    @machine.joltage_requirements = '{3,5,4,7}'
  end

  def test_calculator_is_empty
    assert_empty @calculator
  end

  def test_calculator_can_import_machines
    @calculator.add(@machine)
    refute_empty @calculator
  end

  def test_calculator_can_calculate_fewest_button_presses
    assert_equal 2, @calculator.fewest_button_presses(@machine)
  end

end
