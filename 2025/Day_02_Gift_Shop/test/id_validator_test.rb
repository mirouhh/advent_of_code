require 'minitest/autorun'
require_relative '../lib/id_validator'

class IDValidatorTest < Minitest::Test

  def test_import_range_works
    IDValidator.import("11-22")
    assert IDValidator.range.wont_be_empty
  end
end
