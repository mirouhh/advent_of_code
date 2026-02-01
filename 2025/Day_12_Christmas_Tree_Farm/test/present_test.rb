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

end
