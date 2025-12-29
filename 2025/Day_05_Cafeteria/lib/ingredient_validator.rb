class IngredientValidator

  attr_reader :id_ranges
  def initialize
    @id_ranges = []
  end

  def add_id_range(range)
    @id_ranges << range
  end

end
