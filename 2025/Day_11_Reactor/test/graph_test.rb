require 'minitest/autorun'
require_relative '../lib/graph'

class GraphTest < Minitest::Test

  def setup
    @graph = Graph.new
    @vertex_1 = 'aaa'
    @vertex_2 = 'bbb'
  end

  def test_graph_is_empty
    assert @graph.empty?
  end

  def test_adding_a_vertice
    @graph.add_vertex(@vertex_1)
    refute @graph.empty?
    assert_equal 1, @graph.vertices_count
  end

  def test_adding_an_edge
    @graph.add_vertex(@vertex_1)
    @graph.add_vertex(@vertex_2)
    @graph.add_edge(@vertex_1, @vertex_2)
    assert_equal 1, @graph.edges_count
  end

end
