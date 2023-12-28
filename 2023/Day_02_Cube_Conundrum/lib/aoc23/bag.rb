class Bag
  def initialize
    @cubes = {}
  end

  def empty?
    @cubes.empty?
  end

  def contains?(cube_color)
    cube_color = cube_color.downcase
    @cubes.key? cube_color
  end

  def add_cube(cube_color)
    cube_color = cube_color.downcase
    (contains? cube_color) ? @cubes[cube_color] = (@cubes[cube_color] + 1) : @cubes[cube_color] = 1
  end

  def count_cubes(cube_color)
    cube_color = cube_color.downcase
    (contains? cube_color) ? @cubes[cube_color] : 0
  end
end
