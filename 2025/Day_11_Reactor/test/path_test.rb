require 'minitest/autorun'
require_relative '../lib/path'

class PathTest < Minitest::Test

  def setup
    @path = Path.new
  end

  def test_is_empty
    assert @path.empty?
  end

  def test_add_vertex
    @path.add('aaa')
    refute @path.empty?
  end

  def test_string_representation
    @path.add('aaa')
    @path.add('bbb')
    assert_equal 'aaa -> bbb', @path.to_s
  end

end
