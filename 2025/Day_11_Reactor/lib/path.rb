# frozen_string_literal: true

class Path

  attr_reader :vertices

  def initialize
    @vertices = []
  end

  def empty?
    @vertices.empty?
  end

end
