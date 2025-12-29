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
    @ingredient_validator.add_id_range('1-3')
    assert_equal 1..3, @ingredient_validator.id_ranges[0]
  end

  def test_validate_freshness
    @ingredient_validator.add_id_range('1-3')
    assert @ingredient_validator.fresh?('2')
  end

  def test_validate_spoiledness
    @ingredient_validator.add_id_range('1-3')
    assert_equal false, @ingredient_validator.fresh?('4')
  end

  def test_validate_freshness_in_multiple_id_ranges
    @ingredient_validator.add_id_range('3-5')
    @ingredient_validator.add_id_range('10-14')
    assert @ingredient_validator.fresh?('5')
    assert @ingredient_validator.fresh?('11')
  end

  def test_determines_fresh_ingredients
    @ingredient_validator.add_id_range('3-5')
    @ingredient_validator.add_id_range('10-14')
    @ingredient_validator.fresh?('1')
    @ingredient_validator.fresh?('5')
    @ingredient_validator.fresh?('8')
    @ingredient_validator.fresh?('11')
    @ingredient_validator.fresh?('17')
    @ingredient_validator.fresh?('32')
    assert_equal [5, 11], @ingredient_validator.fresh_ingredients
  end

  def test_determines_fresh_ingredients_amount
    @ingredient_validator.add_id_range('3-5')
    @ingredient_validator.add_id_range('10-14')
    @ingredient_validator.fresh?('1')
    @ingredient_validator.fresh?('5')
    @ingredient_validator.fresh?('8')
    @ingredient_validator.fresh?('11')
    @ingredient_validator.fresh?('17')
    @ingredient_validator.fresh?('32')
    assert_equal 2, @ingredient_validator.fresh_ingredients_amount
  end

  def test_internal_data_can_be_cleared
    @ingredient_validator.add_id_range('3-5')
    @ingredient_validator.add_id_range('10-14')
    @ingredient_validator.fresh?('1')
    @ingredient_validator.fresh?('5')
    @ingredient_validator.fresh?('8')
    @ingredient_validator.fresh?('11')
    @ingredient_validator.fresh?('17')
    @ingredient_validator.fresh?('32')
    assert_equal 2, @ingredient_validator.fresh_ingredients_amount
    assert_equal false, @ingredient_validator.id_ranges.empty?
    assert_equal false, @ingredient_validator.fresh_ingredients.empty?
    @ingredient_validator.clear
    assert_equal 0, @ingredient_validator.fresh_ingredients_amount
    assert @ingredient_validator.id_ranges.empty?
    assert @ingredient_validator.fresh_ingredients.empty?
  end

end
