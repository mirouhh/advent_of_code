class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    self.class == other.class && @x == other.x && @y == other.y
  end

  def eql?(other)
    self == other
  end
end
