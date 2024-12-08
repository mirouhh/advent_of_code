class Report

  attr_reader :content, :issues

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
    @content.each_cons(2) do |a, b|
      is_decreasing = a > b
      @decreasing_issues.concat([a, b]) if !is_decreasing
    end
    @decreasing_issues.empty?
  end

  def increasing?
    @content.each_cons(2) do |a, b|
      is_increasing = a < b
      @increasing_issues.concat([a, b]) if !is_increasing
    end
    @increasing_issues.empty?
  end

  def correct_distances?
    @content.each_cons(2) do |a, b|
      has_correct_distance = (a - b).abs.between?(1, 3)
      @distance_issues.concat([a, b]) if !has_correct_distance
    end
    @distance_issues.empty?
  end

  def safe?
    correct_distances? && (increasing? ^ decreasing?)
  end
end
