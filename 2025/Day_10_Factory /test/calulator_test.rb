require 'minitest/autorun'
require_relative '../lib/calculator'
require_relative '../lib/machine'

class CalculatorTest < Minitest::Test

  def test_calculator_is_empty
    calculator = Calculator.new
    assert_empty calculator
  end

  def test_calculator_can_import_machines
    machine = Machine.new()
    machine.indicator_lights = '[.##.]'
    machine.button_wiring_schematics = '(3) (1,3) (2) (2,3) (0,2) (0,1)'
    machine.joltage_requirements = '{3,5,4,7}'
    calculator = Calculator.new
    calculator.add(machine)
    refute_empty calculator
  end

end
