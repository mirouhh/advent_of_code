# frozen_string_literal: true

class Grid

  def initialize
    @shelfs = []
  end

  def empty?
    @shelfs.empty?
  end

  def add(shelf)
    @shelfs << shelf
  end

end
