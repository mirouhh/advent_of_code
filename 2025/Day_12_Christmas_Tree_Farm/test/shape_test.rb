# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shape'

class ShapeTest < Minitest::Test

  def test_shape_is_empty
    shape = Shape.new
    assert shape.empty?
  end
end
