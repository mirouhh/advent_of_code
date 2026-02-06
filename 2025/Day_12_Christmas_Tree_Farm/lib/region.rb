# frozen_string_literal: true

class Region

  attr_accessor :width

  def initialize(width = 0)
    @width = width
  end

  def empty?
    true
  end

  def length
    0
  end

end
