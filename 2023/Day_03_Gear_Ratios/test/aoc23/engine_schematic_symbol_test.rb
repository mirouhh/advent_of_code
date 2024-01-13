require 'minitest/autorun'
require_relative '../../lib/aoc23/engine_schematic_symbol'

class EngineSchematicSymbolTest < Minitest::Test
  def test_is_initialized_correctly
    symbol = EngineSchematicSymbol.new('$', 1, 5)

    assert_equal '$', symbol.value
    assert_equal 1, symbol.x
    assert_equal 5, symbol.y
  end

  def test_can_be_compared
    first_symbol = EngineSchematicSymbol.new('%', 1, 5)
    second_symbol = EngineSchematicSymbol.new('%', 1, 5)

    assert first_symbol.eql? second_symbol
  end
end
