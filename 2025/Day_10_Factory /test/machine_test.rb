require 'minitest/autorun'
require_relative '../lib/machine'

class MachineTest < Minitest::Test

  def setup
    @machine = Machine.new
  end

  def test_new_machine_has_no_indicator_lights
    assert_empty @machine.indicator_lights
  end

  def test_indicator_lights_can_be_set
    @machine.indicator_lights = '[.##.]'
    refute_empty @machine.indicator_lights
  end

  def test_indicator_lights_are_set_correctly
    indicator_lights = '[.##.]'
    @machine.indicator_lights = indicator_lights
    assert_equal indicator_lights, @machine.indicator_lights
  end

  def test_machine_is_not_running
    indicator_lights = '[.##.]'
    @machine.indicator_lights = indicator_lights
    refute @machine.running?
  end

  def test_machine_is_running
    @machine.indicator_lights = '....'
    assert @machine.running?
  end

  def test_a_new_machine_has_no_button_wiring_schematics
    assert_empty @machine.button_wiring_schematics
  end

  def test_button_wiring_schematics_can_be_set
    @machine.button_wiring_schematics = '(3) (1,3) (2) (2,3) (0,2) (0,1)'
    refute_empty @machine.button_wiring_schematics
  end
end
