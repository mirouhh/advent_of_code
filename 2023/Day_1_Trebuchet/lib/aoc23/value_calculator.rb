require_relative 'string'
require_relative 'array'

class ValueCalculator
  def initialize()
    @values = []
  end

  def add_value(string)
    @values << string.int_array.value
  end

  def sum
    total = 0
    @values.empty? ? total : @values.each { |value| total += value }
    total
  end
end
