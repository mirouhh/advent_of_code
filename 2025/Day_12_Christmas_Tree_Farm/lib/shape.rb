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

end
