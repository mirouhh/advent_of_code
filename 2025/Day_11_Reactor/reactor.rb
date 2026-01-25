# frozen_string_literal: true

require_relative 'lib/graph'
require_relative 'lib/path_finder'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"
new_sample_data = "#{File.dirname(__FILE__)}/new_sample_input.txt"

def result(data, context, start_vertex, end_vertex)
  puts "#### Importing #{context} data ###########################"
  puts "\n"

  graph = Graph.new
  graph.import(data)
  path_finder = PathFinder.new()
  path_finder.add(graph)
  paths = path_finder.find_paths(start_vertex, end_vertex)

  puts "Analysing " + graph.general_info

  puts "Found #{paths.count} paths from '#{start_vertex}' to '#{end_vertex}':"
  paths.each { |path| puts path }
end

def results_part_two(data, context, start_vertex, end_vertex)
  paths = result(data, context, start_vertex, end_vertex)
  puts "\n"
  dac_fft_paths = paths.select { |path| path.vertices.include?('dac') && path.vertices.include?('fft') }
  puts "\n"
  puts "Found #{dac_fft_paths.count} paths from 'dac' to 'fft':"
  dac_fft_paths.each { |path| puts path }
end

puts "####### PART ONE #####################################"
result(sample_data, 'sample', 'you', 'out')
puts "\n"
result(puzzle_data, 'puzzle', 'you', 'out')

puts "\n\n"
puts "####### PART TWO #####################################"
results_part_two(new_sample_data, 'sample', 'svr', 'out')
