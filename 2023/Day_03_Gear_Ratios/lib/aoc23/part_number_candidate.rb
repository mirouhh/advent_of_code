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
end