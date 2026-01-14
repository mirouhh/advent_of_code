require 'minitest/autorun'
require_relative '../lib/machine'

class MachineTest < Minitest::Test

  def test_new_machine_has_no_indicator_lights
    machine = Machine.new
    assert_empty machine.indicator_lights
  end

  def test_indicator_lights_can_be_set
    machine = Machine.new()
    machine.indicator_lights = '[.##.]'
    refute_empty machine.indicator_lights
  end
end
