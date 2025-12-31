require 'minitest/autorun'
require_relative '../lib/instruction_importer'

class InstructionImporterTest < Minitest::Test

  def test_import_instructions_from_file
    instruction_importer = InstructionImporter.new
    instruction_importer.import('sample_input.txt')
    assert_equal false, instruction_importer.data.empty?
  end

end
