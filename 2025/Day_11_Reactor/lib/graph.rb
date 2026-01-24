class Graph

  attr_reader :adjacency_list

  def initialize
    @adjacency_list = {}
  end

  def empty?
    @adjacency_list.empty?
  end

  def add_vertex(vertex)
    @adjacency_list[vertex] = []
  end

  def add_edge(start_vertex, end_vertex)
    @adjacency_list[start_vertex] << end_vertex
  end

  def edges
    @adjacency_list.values.collect { |adjecent_vertices| adjecent_vertices.size }.sum
  end

  def vertices
    @adjacency_list.keys
  end

end
