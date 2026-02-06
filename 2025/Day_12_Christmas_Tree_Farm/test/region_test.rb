# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/region'

class RegionTest < Minitest::Test

  def test_new_region_is_empty
    assert Region.new.empty?
  end
end