require 'minitest/autorun'
require_relative '../lib/path'

class PathTest < Minitest::Test

  def test_path_is_empty
    path = Path.new
    assert path.empty?
  end

end
