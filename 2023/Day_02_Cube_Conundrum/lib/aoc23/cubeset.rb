class Cubeset

  attr_reader :cubes
  def initialize
    @cubes = {}
  end

  def empty?
    @cubes.empty?
  end

  def total
    total = 0
    @cubes.each_key do |key|
      total += @cubes[key]
    end
    total
  end

  def contains?(color)
    color = color.downcase
    @cubes.key? color
  end

  def how_many(color)
    color = color.downcase
    (@cubes.key? color) ? @cubes[color] : 0
  end

  def add_cubes(color, amount)
    color = color.downcase
    @cubes[color] = amount
  end

  def info
    info = []
    @cubes.each_key do |key|
      info << "#{@cubes[key]} #{key}"
    end
    info.join(', ')
  end

  def import(data)
    data = data.chomp.downcase
    amount_search_pattern = /\d/i
    color_search_pattern = /[a-z]/i
    partial_data = data.split(',')
    partial_data.each do | data |
      color = data.scan(color_search_pattern).join
      amount = data.scan(amount_search_pattern).join.to_i
      add_cubes(color, amount)
    end
  end

  def update_cubes(color, amount)
    color = color.chomp.downcase
    @cubes[color] = amount
  end

end
