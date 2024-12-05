require 'minitest/autorun'
require_relative '../lib/report'

class ReportTest < Minitest::Test

  def test_is_decreasing
    report = Report.new('7 6 4 2 1')
    assert report.decreasing?
  end

  def test_is_not_decreasing
    report = Report.new('1 2 7 8 9')
    assert !report.decreasing?
  end

  def test_is_increasing
    report = Report.new('1 2 7 8 9')
    assert report.increasing?
  end

  def test_is_not_increasing
    report = Report.new('1 3 2 4 5')
    assert !report.increasing?
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
    report = Report.new('1 2 7 8 9')
    assert !report.safe?
  end

  def test_has_no_issues
    report = Report.new('7 6 4 2 1')
    assert report.issues.empty?
  end

  def test_has_decreasing_issues
    report = Report.new('5 4 3 1 2')
    assert !report.decreasing?
    assert !report.issues.empty?
    assert_equal [2], report.issues
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
    report = Report.new('1 2 4 3 5')
    assert !report.increasing?
    assert !report.issues.empty?
    assert_equal [3], report.issues
  end

  def test_has_distance_issues
    report = Report.new('7 6 5 1 0')
    assert !report.correct_distances?
    assert !report.issues.empty?
    assert_equal [1], report.issues
  end

end
