class JunctionBox

  attr_reader :x, :y, :z

  def initialize(x=0, y=0, z=0)
    @x = x
    @y = y
    @z = z
  end

  def position(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def to_s
    "(X=#{@x}, Y=#{@y}, Z=#{@z})"
  end
end
