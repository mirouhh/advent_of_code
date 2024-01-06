require 'minitest/autorun'
require_relative '../../lib/aoc23/string'

class StringTest < Minitest::Test

  def test_has_no_symbols_when_no_symbols_are_provided
    assert ''.symbols.empty?
  end

  def test_has_symbols_when_symbols_are_provided
    assert '*'.symbols.any?
  end

  def test_has_star_as_a_symbol_when_stars_were_provided
    test_string = '*'
    assert test_string.symbols.include? '*'
  end

end
