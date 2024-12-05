class Report

  attr_reader :content, :issues

  def initialize(string)
    @content = string.split(' ').map(&:to_i)
    @issues = []
  end

  def decreasing?
    @content.each_cons(2).all? do |a, b|
      is_decreasing = a > b
      @issues << b if !is_decreasing
      is_decreasing
    end
  end

  def increasing?
    @content.each_cons(2).all? do |a, b|
      is_increasing = a < b
      @issues << b if !is_increasing
      is_increasing
    end
  end

  def correct_distances?
    @content.each_cons(2).all? do |a, b|
      has_correct_distance = (a - b).abs.between?(1, 3)
      @issues << b if !has_correct_distance
      has_correct_distance
    end
  end

  def safe?
    increasing? && correct_distances? || decreasing? && correct_distances?
  end
end
