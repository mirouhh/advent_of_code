# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/present'

class PresentTest < Minitest::Test

  def setup
    @present = Present.new
    @shape = <<~SHAPE.chomp
    ###
    ##.
    .##
    .#.
    SHAPE
    @rotated_shape = <<~ROTATEDSHAPE.chomp
    ..##
    ####
    .#.#
    ROTATEDSHAPE
  end

  def test_is_empty
    assert @present.empty?
  end

  def test_index_can_be_set
    @present.index = 0
    refute @present.empty?
    assert_equal 0, @present.index
  end

  def test_has_shape
    @present.shape = @shape
    refute @present.empty?
    assert_equal @shape, @present.shape
  end

  def test_dimensions_are_correct
    @present.shape = @shape
    assert_equal 4, @present.height
    assert_equal 3, @present.width
  end

  def test_can_rotate_clockwise
    @present.shape = @shape
    @present.rotate
    assert_equal @rotated_shape, @present.shape
  end

  def test_can_flip_horizontally
    @horizontally_flipped_shape = <<~HORIZONTALLYFLIPPEDSHAPE.chomp
    ###
    .##
    ##.
    .#.
    HORIZONTALLYFLIPPEDSHAPE
    @present.shape = @shape
    @present.flip_horizontal
    assert_equal @horizontally_flipped_shape, @present.shape
  end

  def test_can_flip_vertically
    @vertically_flipped_shape = <<~VERTICALLYFLIPPEDSHAPE.chomp
    .#.
    .##
    ##.
    ###
    VERTICALLYFLIPPEDSHAPE
    @present.shape = @shape
    @present.flip_vertical
    assert_equal @vertically_flipped_shape, @present.shape
  end

  def test_calulate_area
    @present.shape = @shape
    assert_equal 8, @present.area
  end

end
