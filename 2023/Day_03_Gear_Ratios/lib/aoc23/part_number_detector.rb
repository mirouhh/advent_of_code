require_relative 'string'

class PartNumberDetector

  def initialize
    @part_numbers = []
    @symbols = []
    @numbers = []
  end

  def import(engine_schematic)
    @symbols = engine_schematic.symbols unless engine_schematic.symbols.empty?
    @numbers = engine_schematic.numbers
  end

  def has_valid_part_numbers?
    @part_numbers.any?
  end

  def has_symbols?
    @symbols.any?
  end
  
end
