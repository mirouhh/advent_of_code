# frozen_string_literal: true

class Region

  attr_accessor :width, :length
  attr_reader :quantities

  def initialize(width = 0, length = 0, quantities = [])
    @width = width
    @length = length
    @quantities = quantities
  end

  def empty?
    @width == 0 && @length == 0 && @quantities.empty?
  end

  def area
    width * length
  end

end
