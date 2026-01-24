class Graph

  attr_reader :vertices

  def initialize
    @vertices = {}
  end

  def empty?
    @vertices.empty?
  end

  def add_vertex(vertex)
    @vertices[vertex] = []
  end

  def add_edge(start_vertex, end_vertex)
    @vertices[start_vertex] << end_vertex
  end

  def edges
    @vertices.values.collect { |adjecent_vertices| adjecent_vertices.size }.sum
  end

end
