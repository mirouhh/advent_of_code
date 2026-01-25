# frozen_string_literal: true

class Path

  attr_reader :vertices

  def initialize(vertices = [])
    @vertices = vertices.dup
  end

  def empty?
    @vertices.empty?
  end

  def add(vertex)
    @vertices << vertex
  end

  def to_s
    @vertices.join(" -> ")
  end

  def start
    @vertices.first
  end

  def last
    @vertices.last
  end

  def length
    @vertices.length - 1
  end

end
