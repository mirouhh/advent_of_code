require_relative './issue'
class Report

  attr_reader :content, :decreasing_issues, :increasing_issues, :distance_issues, :issues

  def initialize(string)
    @content = string.split(' ').map(&:to_i)
    @decreasing_issues = []
    @increasing_issues = []
    @distance_issues = []
  end

  def issues
    return @decreasing_issues.concat(@increasing_issues).concat(@distance_issues)
  end

  def decreasing?
    index = 0
    @content.each_cons(2) do |a, b|
      is_decreasing = a > b
      issue = Issue.new(index, a, b)
      @decreasing_issues << issue if !is_decreasing && !decreasing_issues.include?(issue)
      index += 1
    end
    @decreasing_issues.empty?
  end

  def increasing?
    index = 0
    @content.each_cons(2) do |a, b|
      is_increasing = a < b
      issue = Issue.new(index, a, b)
      @increasing_issues << issue if !is_increasing && !increasing_issues.include?(issue)
      index += 1
    end
    @increasing_issues.empty?
  end

  def correct_distances?
    index = 0
    @content.each_cons(2) do |a, b|
      has_correct_distance = (a - b).abs.between?(1, 3)
      issue = Issue.new(index, a, b)
      @distance_issues << issue if !has_correct_distance && !distance_issues.include?(issue)
      index += b
    end
    @distance_issues.empty?
  end

  def safe?
    correct_distances? && (increasing? ^ decreasing?)
  end
end
