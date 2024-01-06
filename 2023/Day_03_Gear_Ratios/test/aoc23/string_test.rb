require 'minitest/autorun'
require_relative '../../lib/aoc23/string'

class StringTest < Minitest::Test

  def test_has_no_symbols_when_no_symbols_contained
    assert ''.symbols.empty?
  end

end
