require 'minitest/autorun'
require_relative '../lib/id_validator'

class IDValidatorTest < Minitest::Test

  def test_import_range_works
    IDValidator.import("11-22")
    expected_result = (11..22).map(&:to_s)
    assert_equal false, IDValidator.range.empty?
    assert_equal(expected_result, IDValidator.range)
  end

  def test_parsing_range_works
    IDValidator.import("11-22")
    assert_equal "11", IDValidator.first_id
    assert_equal "22", IDValidator.last_id
  end

  def test_invalid_range_detection
    assert_equal false, IDValidator.validate("11-22")
  end

  def test_valid_range_detection
    assert IDValidator.validate("12-21")
  end

  def test_detact_invalid_ids
    IDValidator.validate("11-22")
    invalid_ids = ["11", "22"]
    assert_equal invalid_ids, IDValidator.invalid_ids
  end

  def test_sum_of_invalid_ids
    IDValidator.validate("11-22")
    assert_equal 33, IDValidator.sum
  end
end
