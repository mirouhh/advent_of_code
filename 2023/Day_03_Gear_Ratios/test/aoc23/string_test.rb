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

  def test_has_only_one_symbol_regardless_how_often_a_symbol_is_provided
    test_string = '******'
    assert test_string.symbols.include? '*'
    assert_equal 1, test_string.symbols.length
  end

  def test_the_delimiter_is_not_a_symbol
    test_string = '...*......'
    delimiter = '.'

    assert test_string.symbols.include? '*'
    assert test_string.symbols.none? delimiter
    assert_equal 1, test_string.symbols.length
  end

  def test_has_two_symbols
    test_string = '...$.*....'

    assert test_string.symbols.include? '*'
    assert test_string.symbols.include? '$'
    assert_equal 2, test_string.symbols.length
  end

  def test_plus_is_a_symbol
    test_string = '.....+.58.'
    assert test_string.symbols.include? '+'
    assert_equal 1, test_string.symbols.length
  end

  def test_hash_is_a_symbol
    test_string = '......#...'
    assert test_string.symbols.include? '#'
    assert_equal 1, test_string.symbols.length
  end
  def test_has_numbers
    test_string = '467..114..'
    assert_equal 2, test_string.numbers.length
    assert test_string.numbers.includes? '467'
    assert test_string.numbers.includes? '114'
  end

  def test_sample_data_is_handled_correctly
    sample_data_01 = '467..114..'
    sample_data_02 = '...*......'
    sample_data_03 = '..35..633.'
    sample_data_04 = '......#...'
    sample_data_05 = '617*......'
    sample_data_06 = '.....+.58.'
    sample_data_07 = '..592.....'
    sample_data_08 = '......755.'
    sample_data_09 = '...$.*....'
    sample_data_10 = '.664.598..'

    assert sample_data_01.symbols.empty?
    assert_equal 1, sample_data_02.symbols.length
    assert sample_data_02.symbols.include? '*'
    assert sample_data_03.symbols.empty?
    assert_equal 1, sample_data_04.symbols.length
    assert sample_data_04.symbols.include? '#'
    assert_equal 1, sample_data_05.symbols.length
    assert sample_data_05.symbols.include? '*'
    assert_equal 1, sample_data_06.symbols.length
    assert sample_data_06.symbols.include? '+'
    assert sample_data_07.symbols.empty?
    assert sample_data_08.symbols.empty?
    assert_equal 2, sample_data_09.symbols.length
    assert sample_data_09.symbols.include? '$'
    assert sample_data_09.symbols.include? '*'
    assert sample_data_10.symbols.empty?
  end
end
