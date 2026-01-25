# frozen_string_literal: true
require_relative 'graph'
require_relative 'path'

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

  def find_paths(start_vertex, target_vertex)
    @paths = []
    path = Path.new([start_vertex])
    dfs(path, target_vertex)
    @paths
  end

  private

  def dfs(path, target)
    if path.last == target
      @paths << Path.new(path.vertices)
      return
    end

    @graph.adjacent_vertices(path.last)&.each do |neighbour|
      next if path.include?(neighbour)

      path.add(neighbour)
      dfs(path, target)
      path.remove
    end
  end

end
