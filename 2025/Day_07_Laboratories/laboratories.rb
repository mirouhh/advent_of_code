require 'set'
require_relative 'lib/tachyon_manifold'

tachyonManifold = TachyonManifold.new
tachyonManifold.start = 'S'
tachyonManifold.space = '.'
tachyonManifold.splitter = '^'
tachyonManifold.beam = '|'

sample_diagram = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_diagram = "#{File.dirname(__FILE__)}/input.txt"

puts "####### PART ONE ###############################"
puts "#### Importing sample diagram ##################"

tachyonManifold.import(File.readlines("#{sample_diagram}", chomp: true).reject(&:empty?))

puts "\n"
puts tachyonManifold.to_s
puts "\n"

puts "The sample diagram contains #{tachyonManifold.total_splits} splits.\n\n"

tachyonManifold.reset_diagram

tachyonManifold.import(File.readlines("#{puzzle_diagram}", chomp: true).reject(&:empty?))

puts "\n"
puts tachyonManifold.to_s
puts "\n"

puts "The puzzle diagram contains #{tachyonManifold.total_splits} splits.\n\n"
