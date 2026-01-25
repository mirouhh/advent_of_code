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
    @adjacency_list.values
  end

  def edges_count
    edges.collect{ |adjecent_vertices| adjecent_vertices.size }.sum
  end

  def vertices
    @adjacency_list.keys
  end

  def vertices_count
    vertices.size
  end

  def adjacent_vertices(vertex)
    @adjacency_list[vertex]
  end

  def import(data)
    File.readlines("#{data}", chomp: true).reject(&:empty?).each do |line |
      vertex, neighbours = line.split(":")
      neighbours = neighbours.split(" ").map(&:strip)
      add_vertex(vertex)
      neighbours.each { |neighbour| add_edge(vertex, neighbour) }
    end
  end

  def to_s
    <<~INFO
      #{vertices_count} vertices, #{edges_count} edges
    INFO
    
  end

  def remove_vertex(vertex)
    @adjacency_list.delete(vertex)
    remove_edges(vertex)
  end

  def remove_edges(vertex)
    @adjacency_list.values.each do |neighbours|
      neighbours.delete(vertex) if neighbours.include?(vertex)
    end
  end

  def include_vertex(vertex)
    vertices.include?(vertex) && include_vertex(vertex)
  end

  def include_edges(vertex)
    edges.collect { | neighbours | neighbours.include? vertex }.reduce(:&)
  end

end
