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

  def import(file)
    @data = File.readlines("#{file}", chomp: true).reject(&:empty?).each do |line |
      x, y, z = line.split(',').map(&:to_i)
      add(JunctionBox.new(x, y, z))
    end
  end

  private

  def update_distances(new_junction_box)
    @junction_boxes.each do |junction_box|
      @distances << Distance.new(value: distance(junction_box, new_junction_box), start: junction_box, end: new_junction_box)
    end
  end
end
