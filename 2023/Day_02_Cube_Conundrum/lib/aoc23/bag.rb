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

  def how_many(cube_color)
    cube_color = cube_color.downcase
    (contains? cube_color) ? @cubes[cube_color] : 0
  end

  def import(data)
    data = data.chomp.downcase
    amount_search_pattern = /\d/i
    color_search_pattern = /[a-z]/i
    partial_data = data.split(',')
    partial_data.each do | data |
      color = data.scan(color_search_pattern).join
      amount = data.scan(amount_search_pattern).join.to_i
      amount.times { add_cube(color) }
    end
  end
end
