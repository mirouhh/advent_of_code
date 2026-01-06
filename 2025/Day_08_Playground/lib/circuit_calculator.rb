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

end
