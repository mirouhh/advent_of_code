require 'minitest/autorun'
require_relative '../lib/instruction_importer'

class InstructionImporterTest < Minitest::Test

  def test_import_instructions_from_file
    instruction_importer = InstructionImporter.new
    file = "#{File.dirname(__FILE__)}/../sample_input.txt"
    instruction_importer.import(file)
    assert_equal false, instruction_importer.data.empty?
  end

end
