require 'minitest/autorun'
require_relative '../lib/graph'

class GraphTest < Minitest::Test

  def test_graph_is_empty
    graph = Graph.new
    assert graph.empty?
  end

end
