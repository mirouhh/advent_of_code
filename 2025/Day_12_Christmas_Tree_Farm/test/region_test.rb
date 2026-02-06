# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/region'

class RegionTest < Minitest::Test

  def setup
    @region = Region.new
  end

  def test_new_region_is_empty
    assert @region.empty?
  end

  def test_width_is_zero_for_empty_region
    assert_equal 0, @region.width
  end

  def test_length_is_zero_for_empty_region
    assert_equal 0, @region.length
  end

  def test_width_can_be_set
    @region.width = 10
    assert_equal 10, @region.width
  end

  def test_length_can_be_set
    @region.length = 12
    assert_equal 12, @region.length
  end

  def test_area_is_calculated
    assert_equal 0, @region.area
    @region.width = 10
    @region.length = 12
    assert_equal 120, @region.area
  end

  def test_region_with_data_is_not_empty
    @region.width = 10
    @region.length = 12
    refute @region.empty?
  end

end
