# frozen_string_literal: true

require_relative 'lib/graph'
require_relative 'lib/path_finder'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"

def result(data, context)
  puts "#### Importing #{context} data ###########################"
  puts "\n"

  graph = Graph.new
  graph.import(data)
  path_finder = PathFinder.new()
  path_finder.add(graph)
  start_vertex = 'you'
  end_vertex = 'out'
  paths = path_finder.find_paths('you', 'out')

  puts "Analysing " + graph.general_info

  puts "Found #{paths.count} paths from '#{start_vertex}' to '#{end_vertex}':"
  paths.each { |path| puts path }
end

puts "####### PART ONE #####################################"
result(sample_data, 'sample')
