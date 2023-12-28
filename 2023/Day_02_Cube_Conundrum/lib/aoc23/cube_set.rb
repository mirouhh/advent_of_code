class CubeSet
  def initialize
    @cubes = {}
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

end