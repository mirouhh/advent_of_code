require_relative 'lib/tile_calculator'

sample_data = "#{File.dirname(__FILE__)}/sample_input.txt"
puzzle_data = "#{File.dirname(__FILE__)}/input.txt"# frozen_string_literal: true

def calculation_info_part_one(tile_calculator)
  tile_calculator.calculate_rectangles
  <<~INFO

    Imported #{tile_calculator.red_tiles.size} red tiles.
    The largest area of any rectangle is #{tile_calculator.max}.

  INFO
end

tile_calculator = TileCalculator.new

puts "####### PART ONE #####################################"
puts "#### Importing sample data ###########################"

tile_calculator.import(sample_data)
puts calculation_info_part_one(tile_calculator)

