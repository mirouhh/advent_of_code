class PartNumberDetector

  def initialize
    @part_numbers = []
  end

  def import(engine_schematic)

  end

  def has_valid_part_numbers?
    @part_numbers.any?
  end
end
