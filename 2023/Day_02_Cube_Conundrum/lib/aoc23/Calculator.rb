require_relative 'game'
require_relative 'bag'
require_relative 'cube_set'

class Calculator

  attr_reader :error_msgs

  def initialize
    @error_msgs = []
  end

  def compatible?(game, bag)
    has_all_colors_needed?(game, bag) & has_enough_cubes?(game, bag)
  end

  def has_enough_cubes?(game, bag)
    game.cube_sets.each do |cube_set|
      cube_set.cubes.each_key do |color|
        needed_cubes = cube_set.how_many(color)
        available_cubes = bag.how_many(color)
        unless needed_cubes <= available_cubes
          @error_msgs << "Game #{game.id} is impossible as the game needs #{needed_cubes} #{color} cubes but the bag contains only #{available_cubes}"
          return false
        end
      end
    end
    true
  end

  def has_all_colors_needed?(game, bag)
    game.cube_sets.each do |cube_set|
      cube_set.cubes.each_key do |color|
        unless bag.contains? color
          @error_msgs << "Game #{game.id} is impossible as the bag doesn't contain any cube with the color #{color}"
          return false
        end
      end
    end
    true
  end

end
