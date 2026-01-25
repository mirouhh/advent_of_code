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

  def count_paths(start_vertex, target_vertex, memo = {})
    return 1 if start_vertex == target_vertex
    return memo[[start_vertex, target_vertex]] if memo.key?([start_vertex, target_vertex])

    count = 0
    @graph.adjacent_vertices(start_vertex)&.each do |neighbour|
      count += count_paths(neighbour, target_vertex, memo)
    end

    memo[[start_vertex, target_vertex]] = count
    count
  end

  def count_paths_through(start_vertex, target_vertex, via_a, via_b)
    memo = {}

    # Route 1: start → via_a → via_b → target
    route1 = count_paths(start_vertex, via_a, memo) *
             count_paths(via_a, via_b, memo) *
             count_paths(via_b, target_vertex, memo)

    # Route 2: start → via_b → via_a → target
    route2 = count_paths(start_vertex, via_b, memo) *
             count_paths(via_b, via_a, memo) *
             count_paths(via_a, target_vertex, memo)

    route1 + route2
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
