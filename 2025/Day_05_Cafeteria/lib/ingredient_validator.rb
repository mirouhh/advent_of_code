class IngredientValidator

  attr_reader :id_ranges
  def initialize
    @id_ranges = []
  end

  def add_id_range(range)
    @id_ranges << range
  end

  def fresh?(id)
    @id_ranges[0].cover?(id)
  end

end
