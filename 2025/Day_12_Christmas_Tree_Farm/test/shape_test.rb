# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shape'

class ShapeTest < Minitest::Test

  def setup
    @shape = Shape.new
    @grid = <<~GRID.chomp
    ###
    ##.
    .##
    .#.
    GRID
  end

  def test_shape_is_empty
    assert @shape.empty?
  end

  def test_index_can_be_set
    @shape.index = 0
    refute @shape.empty?
    assert_equal 0, @shape.index
  end

  def test_has_region
    @shape.grid = @grid
    refute @shape.empty?
    assert_equal @grid, @shape.grid
  end

  def test_dimensions_are_correct
    @shape.grid = @grid
    assert_equal 4, @shape.height
    assert_equal 3, @shape.width
  end

end
