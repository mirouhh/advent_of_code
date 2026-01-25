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

  def test_find_paths
    path_finder = PathFinder.new
    graph = Graph.new
    graph.add_vertex('aaa')
    graph.add_vertex('bbb')
    graph.add_vertex('ccc')
    graph.add_vertex('ddd')
    graph.add_edge('aaa', 'bbb')
    graph.add_edge('aaa', 'ccc')
    graph.add_edge('ccc', 'ddd')
    path_finder.add(graph)
    paths = path_finder.find_paths('aaa', 'ddd')
    assert_equal 1, paths.count
    assert_equal "aaa -> ccc -> ddd", paths[0].to_s
  end

end
