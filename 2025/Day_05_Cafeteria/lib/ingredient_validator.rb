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

  def fresh_ingredients_amount
    @fresh_ingredients.length
  end

  def clear
    @id_ranges.clear
    @fresh_ingredients.clear
  end

  def fresh_ingredient_ids
    merge_ranges(@id_ranges).sum(&:size)
  end

  private

  def merge_ranges(ranges)
    return 0 if ranges.empty?

    sorted = ranges.sort_by(&:begin)
    merged = [sorted.first]

    sorted[1..].each do |range|
      last = merged.last

      if range.begin <= last.end + 1
        merged[-1] = (last.begin..[last.end, range.end].max)
      else
        merged << range
      end
    end

    merged
  end
end
