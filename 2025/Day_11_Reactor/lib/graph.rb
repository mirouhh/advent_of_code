class Graph

  attr_reader :vertices, :edges

  def initialize
    @vertices = []
    @edges = []
  end

  def empty?
    @vertices.empty?
  end

  def add_vertex(vertex)
    @vertices << vertex
  end

  def add_edge(start_vertex, end_vertex)
    @edges << "#{start_vertex} -> #{end_vertex}"
  end

end
