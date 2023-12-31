require 'minitest/autorun'
require_relative '../../lib/aoc23/part_number_detector'

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
end
