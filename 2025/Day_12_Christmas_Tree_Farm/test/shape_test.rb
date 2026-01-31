# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shape'

class ShapeTest < Minitest::Test

  def setup
    @shape = Shape.new
  end

  def test_shape_is_empty
    assert @shape.empty?
  end

  def test_index_can_be_set
    @shape.index = 0
    refute @shape.empty?
    assert_equal 0, @shape.index
  end

end
