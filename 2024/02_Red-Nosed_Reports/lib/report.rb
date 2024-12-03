class Report

  def initialize(string)
    @content = string.split(' ')
    @content.each_index { |index| @content[index] = @content[index].to_i }
  end

  def decreasing?
    decreasing = true
    number = @content[0]
    1.upto(@content.size - 1) do |index|
      decreasing &&= number >= @content[index]
      number = @content[index]
    end
    decreasing
  end

  def increasing?
    increasing = true
    number = @content[0]
    1.upto(@content.size - 1) do |index|
      increasing &&= number <= @content[index]
      number = @content[index]
    end
    increasing
  end

  def correct_distances?
    correct_distance = true
    number = @content[0]
    1.upto(@content.size - 1) do |index|
      correct_distance &&= (number - @content[index]).abs <= 3 && (number - @content[index]).abs >= 1
      number = @content[index]
    end
    correct_distance
  end

  def safe?
    increasing? && correct_distances? || decreasing? && correct_distances?
  end
end
