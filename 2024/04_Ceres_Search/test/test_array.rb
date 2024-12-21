require 'minitest/autorun'
require_relative '../lib/array'

class TestArray < Minitest::Test

  def test_indices_with_empty_array
    array = []
    assert_equal [], array.indices
  end

  def test_indices_with_one_element
    array = [1]
    indices = array.indices(1)
    assert_equal 1, indices.count
    assert_equal [0], indices
  end

  def test_indices_with_multiple_elements
    array = [1, 2, 1, 3]
    indices = array.indices(1)
    assert_equal 2, indices.count
    assert_equal [0, 2], indices
  end
end