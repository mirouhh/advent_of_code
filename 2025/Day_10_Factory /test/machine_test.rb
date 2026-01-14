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
end
