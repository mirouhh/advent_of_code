class Graph

  attr_reader :vertices

  def initialize
    @vertices = []
  end

  def empty?
    @vertices.empty?
  end

  def add_vertex(vertex)
    @vertices << vertex
  end
end
