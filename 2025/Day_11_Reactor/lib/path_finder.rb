# frozen_string_literal: true
require_relative 'graph'

class PathFinder

  def initialize()
    @graph = Graph.new
  end

  def empty?
    @graph.empty?
  end

  def add(graph)
    @graph = graph
  end
end
