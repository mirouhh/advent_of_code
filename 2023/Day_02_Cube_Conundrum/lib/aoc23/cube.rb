class Cube

  attr_reader :color

  def initialize(color = 'white')
    @color = color.capitalize
  end
end
