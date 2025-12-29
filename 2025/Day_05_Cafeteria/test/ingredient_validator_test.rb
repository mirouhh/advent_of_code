require 'minitest/autorun'
require_relative '../lib/ingredient_validator'

class IngredientValidatorTest < Minitest::Test

  def test_has_empty_id_range
    ingredient_validator = IngredientValidator.new
    assert ingredient_validator.id_ranges.empty?
  end

end
