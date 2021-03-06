class Vertex
  attr_accessor :value, :in_edges, :out_edges, :temp, :perm

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
    @temp = false 
    @perm = false
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex 
    @cost = cost
    add_to_edges
  end

  def add_to_edges 
    @from_vertex.out_edges << self
    @to_vertex.in_edges << self
  end 

  def delete_from_edges
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
  end 

  def destroy!
    delete_from_edges
    @from_vertex = nil 
    @to_vertex = nil 
  end
end
