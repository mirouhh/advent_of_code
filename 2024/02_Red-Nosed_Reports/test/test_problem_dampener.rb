require 'minitest/autorun'
require_relative '../lib/problem_dampener'
require_relative '../lib/report'

class ProblemDampenerTest < Minitest::Test

  def test_report_can_be_imported
    ProblemDampener.import(Report.new('1 3 2 4 5'))
    assert_equal [1,3,2,4,5], ProblemDampener.report.content
  end

  def test_can_not_be_tolerated
    ProblemDampener.import(Report.new('9 7 6 2 1'))
    assert !ProblemDampener.tolerable?
  end

  def test_issues_are_detected_correctly
    ProblemDampener.import(Report.new('1 3 2 4 5'))
    assert_includes ProblemDampener.report.issues, Issue.new(0, 1, 3)
    assert_includes ProblemDampener.report.issues, Issue.new(1, 3, 2)
    assert_includes ProblemDampener.report.issues, Issue.new(2, 2, 4)
  end

  def test_can_be_tolerated
    ProblemDampener.import(Report.new('60, 61, 63, 64, 67, 64'))
    assert ProblemDampener.tolerable?
  end

  def test_can_tolerate_decreasing_issues_with_multiple_equal_elements
    ProblemDampener.import(Report.new('60, 61, 63, 64, 67, 64'))
    assert ProblemDampener.tolerable_decreasing_issues?
  end

  def test_remove_issue
    report = Report.new('60, 61, 63, 64, 67, 64')
    ProblemDampener.import(report)
    updated_content = ProblemDampener.remove_issue(5)
    assert_equal [60, 61, 63, 64, 67], updated_content
  end
end
