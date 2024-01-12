class PartNumberCandidate

  attr_reader :value, :x, :y

  def initialize(value, x, y)
    @value = value
    @x = x
    @y = y
  end

  def length
    @value.to_s.length unless @value.nil?
  end

  def eql?(other)
    @value == other.value && @x == other.x && @y == other.y
  end
end