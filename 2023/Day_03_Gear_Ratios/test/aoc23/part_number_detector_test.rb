require 'minitest/autorun'
require_relative '../../lib/aoc23/part_number_detector'
require_relative '../../lib/aoc23/part_number_candidate'
require_relative '../../lib/aoc23/engine_schematic_symbol'

class PartNumberDetectorTest < Minitest::Test

  def setup
    @part_number_detector = PartNumberDetector.new
  end
  def test_import_data_does_not_contain_valid_part_numbers
    @part_number_detector.import(0, '467..114..')

    assert_equal false, @part_number_detector.has_valid_part_numbers?
  end

  def test_import_data_does_include_a_symbol
    @part_number_detector.import(0, '...*......')

    assert @part_number_detector.has_symbols?
  end

  def test_import_data_does_not_include_a_symbol
    @part_number_detector.import(0, '467..114..')

    assert_equal false, @part_number_detector.has_symbols?
  end

  def test_import_data_includes_a_part_number
    @part_number_detector.import(0, '617*......')

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

  def test_symbol_is_inline_with_number
    part_number_candidate = PartNumberCandidate.new(617, 1, 0)
    right_engine_schematic_symbol = EngineSchematicSymbol.new('$', 4, 0)
    left_engine_schematic_symbol = EngineSchematicSymbol.new('$', 1, 0)

    assert @part_number_detector.inline? part_number_candidate, left_engine_schematic_symbol
    assert @part_number_detector.inline? part_number_candidate, right_engine_schematic_symbol
  end

  def test_symbol_is_above_number
    part_number_candidate = PartNumberCandidate.new(617, 1, 1)
    engine_schematic_symbol = EngineSchematicSymbol.new('$', 1, 0)

    assert @part_number_detector.above? part_number_candidate, engine_schematic_symbol
  end

  def test_number_array_only_contains_numbers
    @part_number_detector.import(0, '467..114..')


    assert @part_number_detector.contains_numbers_only?
  end

  def test_numbers_are_converted_correctly
    @part_number_detector.import(0, '467..114..')
    first_number = PartNumberCandidate.new(467, 0, 0)
    second_number = PartNumberCandidate.new(114, 5, 0)

    assert @part_number_detector.numbers[0].eql? first_number
    assert @part_number_detector.numbers[1].eql? second_number
  end

  def test_symbols_are_converted_correctly
    @part_number_detector.import(0, '617*......')
    symbol = EngineSchematicSymbol.new('*', 3, 0)

    assert @part_number_detector.symbols[0].eql? symbol
  end

  def test_single_lines_can_be_imported
    first_line = '467..114..'
    second_line = '...*......'
    third_line = '..35..633.'
    fourth_line = '......#...'
    fifth_line = '617*......'
    sixth_line = '.....+.58.'
    seventh_line = '..592.....'
    eighth_line = '......755.'
    ninth_line = '...$.*....'
    tenth_line = '.664.598..'

    symbol = EngineSchematicSymbol.new('*', 3, 1)
    first_part_number = PartNumberCandidate.new(467, 0, 0)
    second_part_number = PartNumberCandidate.new(35, 2, 2)
    third_part_number = PartNumberCandidate.new(633, 6, 2)
    non_part_number = PartNumberCandidate.new(114, 5, 0)

    @part_number_detector.import_line(first_line)
    @part_number_detector.import_line(second_line)
    @part_number_detector.import_line(third_line)

    assert @part_number_detector.has_valid_part_numbers?
    assert @part_number_detector.has_symbols?

    assert_equal 1, @part_number_detector.symbols.length
    assert @part_number_detector[0].eql? symbol

    assert_equal 3, @part_number_detector.part_numbers.length
    assert @part_number_detector.part_numbers[0].eql? first_part_number
    assert @part_number_detector.part_numbers[1].eql? second_part_number
    assert @part_number_detector.part_numbers[2].eql? third_part_number

    assert_equal 1, @part_number_detector.numbers.length
    assert @part_number_detector.numbers[0].eql? non_part_number
  end
end
