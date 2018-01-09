# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'
require 'byebug'

def install_order(arr)

  vertices_values = {}
  arr.each do |tuple| 
    item = tuple[0]
    dependency = tuple[1]
    
    if !vertices_values[item]
      vertices_values[item] = Vertex.new(item)

    end 

    if !vertices_values[dependency]
      vertices_values[dependency] = Vertex.new(dependency)
    end
    dependency_v = vertices_values[dependency]
    item_v = vertices_values[item]
    dependency_to_item = Edge.new(dependency_v, item_v)
    # item_to_dependency = Edge.new(item_v, dependency_v)
    dependency_to_item.add_to_edges
  end 

  sorted = topological_sort(vertices_values.values).map{|el| el.value}
  total_modules = ((vertices_values.keys.min)..(vertices_values.keys.max)).to_a
  total_modules.each do |el| 
    sorted << el if !sorted.include?(el)
  end 
  sorted
end
