require 'minitest/autorun'
require_relative '../lib/report'

class TestReport < Minitest::Test

  def test_is_decreasing
    report = Report.new('57 54 53 52')
    assert report.decreasing?
  end

  def test_is_not_decreasing
    report = Report.new('57 54 53 55 52')
    assert !report.decreasing?
  end

  def test_is_increasing
    report = Report.new('1 2 7 8 9')
    assert report.increasing?
  end

  def test_is_not_increasing
    report = Report.new('88 87 91 93 94')
    result = !report.increasing?
    assert result #!report.increasing?
  end

  def test_has_correct_distances
    report = Report.new('7 6 4 2 1')
    assert report.correct_distances?
  end

  def test_has_not_correct_distances
    report = Report.new('9 7 6 2 1')
    assert !report.correct_distances?
  end

  def test_is_safe
    report = Report.new('1 3 6 7 9')
    assert report.safe?
  end

  def test_is_not_safe
    report = Report.new('60 61 63 64 67 64')
    assert !report.safe?
    assert !report.issues.empty?
  end

  def test_has_no_issues
    report = Report.new('7 6 4 2 1')
    assert report.issues.empty?
  end

  def test_has_decreasing_issues
    report = Report.new('60 61 63 64 67 64')
    assert !report.decreasing?
    assert !report.issues.empty?
  end

  def test_min_distance_is_1
    report = Report.new('7 6 4 2 2 1')
    assert !report.correct_distances?
  end

  def test_max_distance_is_3
    report = Report.new('7 6 5 1 0')
    assert !report.correct_distances?
  end

  def test_has_increasing_issues
    report = Report.new('60 61 63 64 67 64')
    assert !report.increasing?
    assert !report.issues.empty?
  end

  def test_has_distance_issues
    report = Report.new('7 6 5 1 0')
    assert !report.correct_distances?
    assert !report.issues.empty?
  end

  def test_has_issues
    report = Report.new('7 6 5 1 0')
    report.increasing?
    report.decreasing?
    report.correct_distances?
    assert !report.issues.empty?
  end

  def test_correct_decreasing_issues
    report = Report.new('54 58 61 64 66 69 71 74')
    report.correct_distances?
    assert !report.decreasing_issues.empty?
    assert_includes report.decreasing_issues, Issue.new(0, 54, 58)
    assert_includes report.decreasing_issues, Issue.new(1, 58, 61)
  end

  def test_correct_increasing_issues
    report = Report.new('88 87 91 93 94')
    report.increasing?
    assert !report.increasing_issues.empty?
    assert_equal 1, report.increasing_issues.count
    assert_includes report.increasing_issues, Issue.new(0, 88, 87)
  end

  def test_correct_decreasing_issues
    report = Report.new('88 87 91 93 94')
    report.decreasing?
    assert !report.decreasing_issues.empty?
    assert_equal 3, report.decreasing_issues.count
    assert_includes report.decreasing_issues, Issue.new(1, 87, 91)
    assert_includes report.decreasing_issues, Issue.new(2, 91, 93)
    assert_includes report.decreasing_issues, Issue.new(3, 93, 94)
  end

end
