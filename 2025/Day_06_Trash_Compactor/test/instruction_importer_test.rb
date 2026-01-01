require 'minitest/autorun'
require_relative '../lib/instruction_importer'

class InstructionImporterTest < Minitest::Test

  def setup
    @instruction_importer = InstructionImporter.new
    file = "#{File.dirname(__FILE__)}/../sample_input.txt"
    @instruction_importer.import(file)
  end

  def test_import_instructions_from_file
    assert_equal false, @instruction_importer.data.empty?
  end

  def test_imported_data_can_be_reset
    @instruction_importer.reset
    assert @instruction_importer.data.empty?
  end

  def test_get_instructions_for_part_one
    assert_equal false, @instruction_importer.instructions_part_one.empty?
  end

  def test_instructions_for_part_one_are_correct
    instructions = @instruction_importer.instructions_part_one
    assert_equal ['123', '45', '6', '*'], instructions[0]
    assert_equal ['328', '64', '98', '+'], instructions[1]
    assert_equal ['51', '387', '215', '*'], instructions[2]
    assert_equal ['64', '23', '314', '+'], instructions[3]
  end

  def test_get_instructions_for_part_two
    assert_equal false, @instruction_importer.instructions_part_two.empty?
  end

  def test_instructions_for_part_two_are_correct
    instructions = @instruction_importer.instructions_part_two
    assert_equal ['4', '431', '623', '+'], instructions[0]
    assert_equal ['175', '581', '32', '*'], instructions[1]
    assert_equal ['8', '248', '369', '+'], instructions[2]
    assert_equal ['356', '24', '1', '*'], instructions[3]
  end

  def test_find_operator_positions
    assert_equal [0, 4, 8, 12], @instruction_importer.operator_positions
  end

  def test_data_ranges_are_correct
    assert_equal [0..2, 4..6, 8..10, 12..15], @instruction_importer.data_ranges
  end

  def test_operators_part_one_are_correct
    assert_equal ['*', '+', '*', '+'], @instruction_importer.operators_part_one
  end

  def test_operators_part_two_are_correct
    assert_equal ['+', '*', '+', '*'], @instruction_importer.operators_part_two
  end

  def test_numbers_are_correct
    assert_equal ['123', '328', ' 51', '64 '], @instruction_importer.numbers[0]
    assert_equal [' 45', '64 ', '387', '23 '], @instruction_importer.numbers[1]
    assert_equal ['  6', '98 ', '215', '314'], @instruction_importer.numbers[2]
  end
  def test_operands_part_one_are_correct
    assert_equal ['123', '45', '6'], @instruction_importer.operands_part_one[0]
    assert_equal ['328', '64', '98'], @instruction_importer.operands_part_one[1]
    assert_equal ['51', '387', '215'], @instruction_importer.operands_part_one[2]
    assert_equal ['64', '23', '314'], @instruction_importer.operands_part_one[3]
  end

  def test_operands_part_two_are_correct
    assert_equal ['4', '431', '623'], @instruction_importer.operands_part_two[0]
    assert_equal ['175', '581', '32'], @instruction_importer.operands_part_two[1]
    assert_equal ['8', '248', '369'], @instruction_importer.operands_part_two[2]
    assert_equal ['356', '24', '1'], @instruction_importer.operands_part_two[3]
  end

end
