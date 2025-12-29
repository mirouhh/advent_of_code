require 'minitest/autorun'
require_relative '../lib/ingredient_validator'

class IngredientValidatorTest < Minitest::Test

  def setup
    @ingredient_validator = IngredientValidator.new
  end

  def test_has_empty_id_range
    assert @ingredient_validator.id_ranges.empty?
  end

  def test_stores_an_id_range
    @ingredient_validator.add_id_range(1..3)
    assert_equal 1..3, @ingredient_validator.id_ranges[0]
  end

  def test_validate_freshness
    @ingredient_validator.add_id_range(1..3)
    assert @ingredient_validator.fresh?(2)
  end

end
