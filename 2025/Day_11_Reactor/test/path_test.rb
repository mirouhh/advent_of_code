require 'minitest/autorun'
require_relative '../lib/path'

class PathTest < Minitest::Test

  def test_is_empty
    path = Path.new
    assert path.empty?
  end

  def test_add_vertex
    path = Path.new
    path.add('aaa')
    refute path.empty?
  end

  def test_string_representation
    path = Path.new
    path.add('aaa')
    path.add('bbb')
    assert_equal 'aaa -> bbb', path.to_s
  end

end
