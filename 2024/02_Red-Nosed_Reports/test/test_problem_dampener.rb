require 'minitest/autorun'
require_relative '../lib/problem_dampener'
require_relative '../lib/report'

class ProblemDampenerTest < Minitest::Test

  def test_report_can_be_imported
    ProblemDampener.import(Report.new('1 3 2 4 5'))
    assert_equal [1,3,2,4,5], ProblemDampener.report.content
  end

  def test_can_be_tolerated
    ProblemDampener.import(Report.new('1 3 2 4 5'))
    assert ProblemDampener.tolerable?
  end

  def test_if_3_is_identified_as_a_possible_fix
    ProblemDampener.import(Report.new('1 3 2 4 5'))
    assert ProblemDampener.issues.include? 3
  end

  def test_can_not_be_tolerated
    ProblemDampener.import(Report.new('9 7 6 2 1'))
    assert !ProblemDampener.tolerable?
  end

end
