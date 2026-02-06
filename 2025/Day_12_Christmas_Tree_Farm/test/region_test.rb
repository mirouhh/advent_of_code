# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/region'

class RegionTest < Minitest::Test

  def test_new_region_is_empty
    assert Region.new.empty?
  end

  def test_width_is_zero_for_empty_region
    assert_equal 0, Region.new.width
  end

end
