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

end
