class Issue

  attr_reader :index, :left, :right

  def initialize(index, left, right)
    @index = index
    @left = left
    @right = right
  end

  def ==(other)
    self.class == other.class && @left == other.left && @right == other.right
  end

  def eql?(other)
    self.class == other.class && @left == other.left && @right == other.right
  end

end
