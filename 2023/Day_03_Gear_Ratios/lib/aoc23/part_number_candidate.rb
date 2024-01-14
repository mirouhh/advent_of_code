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
    @value.eql?(other.value) && @x.eql?(other.x) && @y.eql?(other.y)
  end

  def to_s
    "Value: #{@value}, x: #{@x}, y: #{@y}"
  end
end