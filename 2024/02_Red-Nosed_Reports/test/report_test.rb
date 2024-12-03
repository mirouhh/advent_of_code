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
end
