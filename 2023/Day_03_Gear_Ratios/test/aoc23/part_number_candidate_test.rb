require 'minitest/autorun'
require_relative '../../lib/aoc23/part_number_candidate'

class PartNumberCandidateTest < Minitest::Test
  def test_is_initialized_correctly
    part_number_candidate = PartNumberCandidate.new(467, 0, 0)

    assert_equal 467, part_number_candidate.value
    assert_equal 0, part_number_candidate.x
    assert_equal 0, part_number_candidate.y
    assert_equal 3, part_number_candidate.length
  end

  def test_can_be_compared
    first_part_number_candidate = PartNumberCandidate.new(467, 0, 0)
    second_part_number_candidate = PartNumberCandidate.new(467, 0, 0)

    assert first_part_number_candidate.eql? second_part_number_candidate
  end
end
