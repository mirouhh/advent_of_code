class PartNumberDetector

  def initialize
    @part_numbers = []
    @symbols = []
  end

  def import(engine_schematic)

  end

  def has_valid_part_numbers?
    @part_numbers.any?
  end

  def has_symbols?
    @symbols.any?
  end
  
end
