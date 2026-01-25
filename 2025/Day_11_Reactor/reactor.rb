# frozen_string_literal: true

require_relative 'lib/graph'
require_relative 'lib/path_finder'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"
new_sample_data = "#{File.dirname(__FILE__)}/new_sample_input.txt"

def setup(data)
  graph = Graph.new
  graph.import(data)
  path_finder = PathFinder.new
  path_finder.add(graph)

  [graph, path_finder]
end

def result(data, context, start_vertex, end_vertex, via_a = nil, via_b = nil)
  puts "#### Importing #{context} data ###########################\n\n"

  graph, path_finder = setup(data)
  puts "Analysing " + graph.general_info

  if via_a && via_b
    puts "Counting paths through '#{via_a}' and '#{via_b}'...\n\n"
    total = path_finder.count_paths_through(start_vertex, end_vertex, via_a, via_b)
    puts "Total paths through '#{via_a}' and '#{via_b}': #{total}"
  else
    total = path_finder.count_paths(start_vertex, end_vertex)
    puts "Total paths from '#{start_vertex}' to '#{end_vertex}': #{total}"
  end
end

puts "####### PART ONE #####################################"
result(sample_data, 'sample', 'you', 'out')
puts "\n"
result(puzzle_data, 'puzzle', 'you', 'out')

puts "\n\n"
puts "####### PART TWO #####################################"
result(new_sample_data, 'sample', 'svr', 'out', 'dac', 'fft')
puts "\n"
result(puzzle_data, 'puzzle', 'svr', 'out', 'dac', 'fft')
