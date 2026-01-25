require 'minitest/autorun'
require_relative '../lib/graph'

class GraphTest < Minitest::Test

  def setup
    @graph = Graph.new
    @vertex_1 = 'aaa'
    @vertex_2 = 'bbb'
    @data = "#{File.dirname(__FILE__)}/../sample_input.txt"
    @prefilled_graph = Graph.new
    @prefilled_graph.add_vertex(@vertex_1)
    @prefilled_graph.add_vertex(@vertex_2)
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
    @prefilled_graph.add_edge(@vertex_1, @vertex_2)
    assert_equal 1, @prefilled_graph.edges_count
  end

  def test_adjecent_vertices
    @prefilled_graph.add_edge(@vertex_1, @vertex_2)
    assert_equal [@vertex_2], @prefilled_graph.adjacent_vertices(@vertex_1)
  end

  def test_import_data
    assert @graph.empty?
    @graph.import(@data)
    refute @graph.empty?
  end

  def test_imported_data_is_correct
    @graph.import(@data)
    assert_equal 10, @graph.vertices_count
    assert_equal 17, @graph.edges_count
  end

  def test_remove_vertex
    @prefilled_graph.remove_vertex(@vertex_2)
    refute @prefilled_graph.include_vertex(@vertex_2)
  end

end
