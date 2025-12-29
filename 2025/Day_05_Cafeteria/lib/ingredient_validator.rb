class IngredientValidator

  attr_reader :id_ranges
  def initialize
    @id_ranges = []
  end

  def add_id_range(range)
    @id_ranges << Range.new(*range.split('-').map(&:to_i))
  end

  def fresh?(*ids)
    ids.all? {|id| @id_ranges.any? {|range| range.cover?(id)}}
  end

end
