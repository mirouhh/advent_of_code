class IngredientValidator

  attr_reader :id_ranges, :fresh_ingredients

  def initialize
    @id_ranges = []
    @fresh_ingredients = []
  end

  def add_id_range(range)
    @id_ranges << Range.new(*range.split('-').map(&:to_i))
  end

  def fresh?(id)
    @id_ranges.any? { |range| range.cover?(id.to_i) }.tap { |is_fresh | @fresh_ingredients << id.to_i if is_fresh }
  end

end
