class CephalopodCalculator

  def calculate(*operands, operator)
    operands.map(&:to_i).reduce(operator.to_sym)
  end
end
