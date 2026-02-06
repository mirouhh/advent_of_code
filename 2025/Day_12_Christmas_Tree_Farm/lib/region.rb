# frozen_string_literal: true

class Region

  attr_accessor :width, :length

  def initialize(width = 0, length = 0)
    @width = width
    @length = length
  end

  def empty?
    true
  end

end
