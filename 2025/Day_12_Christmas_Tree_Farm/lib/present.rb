# frozen_string_literal: true

class Present

  attr_accessor :index, :shape

  def initialize(index = nil, shape = "")
    @index = index
    @shape = shape
  end

  def empty?
    index.nil? & shape.empty?
  end

  def height
    @shape.lines.size
  end

  def width
    @shape.lines.map { | line | line.strip.size }.max
  end

end
