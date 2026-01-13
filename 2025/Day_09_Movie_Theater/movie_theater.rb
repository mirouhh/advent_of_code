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

def calculation_info_part_two(tile_calculator)
  tile_calculator.add_green_tiles
  tile_calculator.calculate_valid_rectangles
  <<~INFO
    Imported #{tile_calculator.red_tiles.size} red tiles and added #{tile_calculator.green_tiles.size} green tiles.
    The largest valid area of any rectangle using only red and green tiles is #{tile_calculator.max_valid_area}.

  INFO
end

tile_calculator = TileCalculator.new

puts "####### PART ONE & TWO ###############################"
puts "#### Importing sample data ###########################"

tile_calculator.import(sample_data)
puts calculation_info_part_one(tile_calculator)
puts calculation_info_part_two(tile_calculator)

puts "#### Importing puzzle data ###########################"

tile_calculator.clean
tile_calculator.import(puzzle_data)
puts calculation_info_part_one(tile_calculator)
puts calculation_info_part_two(tile_calculator)
