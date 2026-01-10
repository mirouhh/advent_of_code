class CircuitCalculator

  attr_reader :circuits, :distances, :junction_boxes

  def initialize
    @circuits = []
    @distances = []
    @junction_boxes = []
  end

  def empty?
    @circuits.empty? && @junction_boxes.empty? && @distances.empty?
  end

  def add(junction_box)
    update_distances(junction_box)
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

  def connect_boxes(connection_amount)
    @circuits = @junction_boxes.map { | box | [box] }

    @distances.sort_by(&:value).first(connection_amount).each do |distance|
      circuit_start = find_circuit(distance.start)
      circuit_end = find_circuit(distance.end)

      next if circuit_start == circuit_end

      circuit_start.concat(circuit_end)
      @circuits.delete(circuit_end)
    end
  end

  def connect_all
    @circuits = @junction_boxes.map { |box| [box] }
    @last_connection = nil

    @distances.sort_by(&:value).each do |distance|
      break if @circuits.size == 1

      circuit_start = find_circuit(distance.start)
      circuit_end = find_circuit(distance.end)

      next if circuit_start == circuit_end

      circuit_start.concat(circuit_end)
      @circuits.delete(circuit_end)
      @last_connection = distance
    end
  end

  def circuits
    @circuits.sort_by(&:size).reverse
  end

  def multiply(number_of_largest_circuits)
    circuits.first(number_of_largest_circuits).map(&:size).reduce(:*)
  end

  def clear
    @circuits.clear
    @distances.clear
    @junction_boxes.clear
  end

  private

  def update_distances(new_junction_box)
    @junction_boxes.each do |junction_box|
      @distances << Distance.new(value: distance(junction_box, new_junction_box), start: junction_box, end: new_junction_box)
    end
  end

  def find_circuit(junction_box)
    @circuits.find {|circuit| circuit.include?(junction_box)}
  end
end
