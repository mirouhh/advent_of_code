class CephalopodCalculator

  def initialize
    @totals = []
  end
  def calculate(*operands, operator)
    operands.map(&:to_i).reduce(operator.to_sym).tap { | total | @totals << total }
  end

  def grand_total
    @totals.sum
  end
end
