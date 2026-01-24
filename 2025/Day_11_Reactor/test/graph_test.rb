require 'minitest/autorun'
require_relative '../lib/graph'

class GraphTest < Minitest::Test

  def test_graph_is_empty
    graph = Graph.new
    assert graph.empty?
  end

  def test_adding_a_vertice
    graph = Graph.new
    graph.add_vertex('abc')
    refute graph.empty?
    assert_equal 1, graph.vertices.size
  end

end
