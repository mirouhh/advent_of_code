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

  def execute_instruction(instruction)
    operands = instruction.flatten[0..-2]
    operator = instruction.flatten[-1]
    calculate(*operands, operator)
  end

  def execute_instructions
    @instructions.each do | instruction |
      execute_instruction(instruction)
    end
  end
end
