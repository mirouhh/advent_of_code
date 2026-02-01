# frozen_string_literal: true

class Shape

  attr_accessor :index, :grid

  def initialize(index = nil, grid = "")
    @index = index
    @grid = grid
  end

  def empty?
    index.nil? & grid.empty?
  end

  def height
    @grid.lines.size
  end

  def width
    @grid.lines.map { | line | line.strip.size }.max
  end

end
