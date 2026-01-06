class CircuitCalculator

  attr_reader :circuits, :distances

  def initialize
    @circuits = []
    @distances = []
    @junction_boxes = []
  end

  def empty?
    @circuits.empty?
  end

  def add(junction_box)
    update_distances(junction_box)
    @circuits << junction_box
    @junction_boxes << junction_box
  end

  def distance(junction_box_one, junction_box_two)
    Math.sqrt((junction_box_one.x - junction_box_two.x)**2 + (junction_box_one.y - junction_box_two.y)**2 + (junction_box_one.z - junction_box_two.z)**2)
  end

  private

  def update_distances(new_junction_box)
    @junction_boxes.each { |junction_box| @distances << distance(new_junction_box, junction_box) }
  end
end
