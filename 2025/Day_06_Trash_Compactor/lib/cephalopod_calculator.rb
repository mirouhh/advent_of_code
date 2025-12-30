class CephalopodCalculator

  attr_reader :instructions

  def initialize
    @totals = []
    @instructions = []
  end
  def calculate(*operands, operator)
    operands.map(&:to_i).reduce(operator.to_sym).tap { | total | @totals << total }
  end

  def grand_total
    @totals.sum
  end

  def add_instruction(*instruction)
    @instructions << instruction
  end
end
