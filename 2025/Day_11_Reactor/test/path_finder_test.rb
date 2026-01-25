require 'minitest/autorun'
require_relative '../lib/path_finder'

class PathFinderTest < Minitest::Test

  def test_is_empty
    path_finder = PathFinder.new
    assert path_finder.empty?
  end

  def test_add_graph
    path_finder = PathFinder.new
    graph = Graph.new
    graph.add_vertex('aaa')
    graph.add_vertex('bbb')
    graph.add_vertex('ccc')
    path_finder.add(graph)
    refute path_finder.empty?
  end

end
