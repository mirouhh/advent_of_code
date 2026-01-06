class CircuitCalculator

  attr_reader :circuits

  def initialize
    @circuits = []
  end

  def empty?
    @circuits.empty?
  end

  def add(junction_box)
    @circuits << junction_box
  end

  def distance(junction_box_one, junction_box_two)
    Math.sqrt((junction_box_one.x - junction_box_two.x)**2 + (junction_box_one.y - junction_box_two.y)**2 + (junction_box_one.z - junction_box_two.z)**2)
  end
end
