require 'minitest/autorun'
require_relative '../../lib/aoc23/part_number_detector'
require_relative '../../lib/aoc23/part_number_candidate'
require_relative '../../lib/aoc23/engine_schematic_symbol'

class PartNumberDetectorTest < Minitest::Test

  def setup
    @part_number_detector = PartNumberDetector.new
  end
  def test_has_no_valid_part_numbers
    @part_number_detector.import("467..114..")

    assert_equal false, @part_number_detector.has_valid_part_numbers?
  end

  def test_has_a_symbol
    @part_number_detector.import('...*......')

    assert @part_number_detector.has_symbols?
  end

  def test_has_no_symbol
    @part_number_detector.import("467..114..")

    assert_equal false, @part_number_detector.has_symbols?
  end

  def test_has_a_part_number
    @part_number_detector.import('617*......')

    assert @part_number_detector.has_valid_part_numbers?
  end

  def test_number_is_adjacent_to_a_symbol
    part_number_candidate = PartNumberCandidate.new(617, 0, 0)
    engine_schematic_symbol = EngineSchematicSymbol.new('$', 4, 0)

    assert @part_number_detector.adjacent? part_number_candidate, engine_schematic_symbol
  end

  def test_number_is_not_adjacent_to_a_symbol
    part_number_candidate = PartNumberCandidate.new(617, 0, 0)
    engine_schematic_symbol = EngineSchematicSymbol.new('$', 5, 0)

    assert_equal false, @part_number_detector.adjacent?(part_number_candidate, engine_schematic_symbol)
  end

  def test_is_inline_with_number
    part_number_candidate = PartNumberCandidate.new(617, 1, 0)
    right_engine_schematic_symbol = EngineSchematicSymbol.new('$', 4, 0)
    left_engine_schematic_symbol = EngineSchematicSymbol.new('$', 1, 0)

    assert @part_number_detector.inline? part_number_candidate, left_engine_schematic_symbol
    assert @part_number_detector.inline? part_number_candidate, right_engine_schematic_symbol
  end
end
