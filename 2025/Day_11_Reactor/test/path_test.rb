require 'minitest/autorun'
require_relative '../lib/path'

class PathTest < Minitest::Test

  def setup
    @path = Path.new
    @vertex_1 = 'aaa'
    @vertex_2 = 'bbb'
    @vertex_3 = 'ccc'
    @path.add(@vertex_1)
    @path.add(@vertex_2)
    @path.add(@vertex_3)
  end

  def test_is_empty
    assert Path.new.empty?
  end

  def test_add_vertex
    refute @path.empty?
  end

  def test_string_representation
    assert_equal 'aaa -> bbb -> ccc', @path.to_s
  end

  def test_start
    assert_equal @vertex_1, @path.start
  end

  def test_end
    assert_equal @vertex_3, @path.last
  end

  def test_length
    assert_equal 2  , @path.length
  end

end
