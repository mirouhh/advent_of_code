require 'minitest/autorun'
require_relative '../lib/machine'

class MachineTest < Minitest::Test

  def test_new_machine_has_no_indicator_lights
    machine = Machine.new
    assert_empty machine.indicator_lights
  end
end
