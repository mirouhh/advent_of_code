require 'minitest/autorun'

class PartNumberDetectorTest < Minitest::Test
  def test_has_no_valid_part_numbers
    part_number_detector = PartNumberDetector.new
    part_number_detector.import("467..114..")

    assert_equal false, part_number_detector.has_valid_part_numbers?
  end
end