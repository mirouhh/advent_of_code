# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shape'

class ShapeTest < Minitest::Test

  def test_shape_is_empty
    shape = Shape.new
    assert shape.empty?
  end

  def test_index_can_be_set
    shape = Shape.new
    shape.index = 0
    refute shape.empty?
    assert_equal 0, shape.index
  end

end
