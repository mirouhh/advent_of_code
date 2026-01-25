require 'minitest/autorun'
require_relative '../lib/path_finder'

class PathFinderTest < Minitest::Test

  def test_is_empty
    path_finder = PathFinder.new
    assert path_finder.empty?
  end

end
