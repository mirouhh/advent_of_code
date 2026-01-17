require 'minitest/autorun'
require_relative '../lib/machine'

class MachineTest < Minitest::Test

  def setup
    @machine = Machine.new
    @indicator_lights = '[.##.]'
    @initial_state = '....'
    @button_wiring_schematics = '(3) (1,3) (2) (2,3) (0,2) (0,1)'
    @joltage_requirements = '{3,5,4,7}'
  end

  def test_new_machine_has_no_indicator_lights
    assert_empty @machine.indicator_lights
  end

  def test_indicator_lights_can_be_set
    @machine.indicator_lights = @indicator_lights
    refute_empty @machine.indicator_lights
  end

  def test_indicator_lights_are_set_correctly
    @machine.indicator_lights = @indicator_lights
    assert_equal @indicator_lights, @machine.indicator_lights
  end

  def test_machine_is_not_running
    @machine.indicator_lights = @indicator_lights
    refute @machine.running?
  end

  def test_machine_is_running
    @machine.indicator_lights = @initial_state
    assert @machine.running?
  end

  def test_a_new_machine_has_no_button_wiring_schematics
    assert_empty @machine.button_wiring_schematics
  end

  def test_button_wiring_schematics_can_be_set
    @machine.button_wiring_schematics = @button_wiring_schematics
    refute_empty @machine.button_wiring_schematics
  end

  def test_button_wiring_schematics_is_set_correctly
    @machine.button_wiring_schematics = @button_wiring_schematics
    assert_equal @button_wiring_schematics, @machine.button_wiring_schematics
  end

  def test_toggling_works
    @machine.current_state = @initial_state
    @machine.toggle('2')
    assert_equal '..#.', @machine.current_state
  end

  def test_machine_is_not_ready
    refute @machine.ready?
  end

  def test_machine_is_ready
    @machine.indicator_lights = @indicator_lights
    @machine.button_wiring_schematics = @button_wiring_schematics
    @machine.joltage_requirements = @joltage_requirements
    assert @machine.ready?
  end

  def test_joltage_requirements_are_set_correctly
    @machine.joltage_requirements = @joltage_requirements
    assert_equal @joltage_requirements, @machine.joltage_requirements
  end

  def test_machine_string_representation
    @machine.indicator_lights = @indicator_lights
    @machine.button_wiring_schematics = @button_wiring_schematics
    @machine.joltage_requirements = @joltage_requirements
    assert_equal "#{@indicator_lights} #{@button_wiring_schematics} #{@joltage_requirements}", @machine.to_s
  end
end
