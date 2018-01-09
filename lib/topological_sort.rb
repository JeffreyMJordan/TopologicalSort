require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

#Queue up all the vertices with no edges 
#Pop off vertives from queue 
  #Remove vertex and out-edges from graph 
  #Push vertex into sorted
  #Examine destination vertices, push onto queue if no more in-edges

#Kahn's algorithm
# def topological_sort(vertices)
#   q = []
#   sorted = []
#   counts = {}
#   vertices.each do |v| 
#     if v.in_edges.empty? 
#       q << v
#     end
#     counts[v] = v.in_edges.length 
#   end

#   until q.empty? 
#     curr = q.shift
#     sorted << curr
#     curr.out_edges.each do |out| 
#       counts[out.to_vertex] -= 1
#       if counts[out.to_vertex] == 0 
#         q << out.to_vertex
#       end 
#     end
#     vertices.delete(curr)
#   end 
#   counts.each do |k, v| 
#     return [] if v!=0 
#   end 
#   sorted
# end

#Tarjan's algorithm
def topological_sort(vertices)
  sorted = []
  cycle = [false]
  vertices.each do |node| 
    visit(node, sorted, cycle)
  end   
  if cycle[0]
    return []
  end 
  sorted
end

def visit(node, sorted, cycle)
  return if node.perm
  if node.temp
    cycle[0] = true 
    return true
  end 
  node.temp = true 
  node.out_edges.each do |out| 
    visit(out.to_vertex, sorted, cycle)
  end   
  node.perm = true
  sorted.unshift(node)
end 
