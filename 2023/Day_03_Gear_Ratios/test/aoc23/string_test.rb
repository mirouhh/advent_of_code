require 'minitest/autorun'
require_relative '../../lib/aoc23/string'

class StringTest < Minitest::Test

  def test_has_no_symbols_when_no_symbols_are_provided
    assert ''.symbols.empty?
    assert_kind_of Array, ''.symbols
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
    assert_equal 6, test_string.symbols.length
  end

  def test_the_delimiter_is_not_a_symbol
    test_string = '...*...*..'
    delimiter = '.'

    assert test_string.symbols.include? '*'
    assert test_string.symbols.none? delimiter
    assert_equal 2, test_string.symbols.length
  end

  def test_has_all_indexes_of_a_substring
    test_string = '...*...*..'
    # Indexes = 3, 7

    assert_equal 2, test_string.indexes('*').length
    assert_equal 3, test_string.indexes('*')[0]
    assert_equal 7, test_string.indexes('*')[1]
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
    assert test_string.numbers.include? '467'
    assert test_string.numbers.include? '114'
  end

  def test_sample_data_symbols_are_detected_correctly
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

  def test_sample_data_numbers_are_detected_correctly
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

    assert sample_data_01.numbers.any?
    assert_equal 2, sample_data_01.numbers.length
    assert sample_data_01.numbers.include? '467'
    assert sample_data_01.numbers.include? '114'

    assert sample_data_02.numbers.empty?

    assert sample_data_03.numbers.any?
    assert_equal 2, sample_data_03.numbers.length
    assert sample_data_03.numbers.include? '35'
    assert sample_data_03.numbers.include? '633'

    assert sample_data_04.numbers.empty?

    assert sample_data_05.numbers.any?
    assert_equal 1, sample_data_05.numbers.length
    assert sample_data_05.numbers.include? '617'

    assert sample_data_06.numbers.any?
    assert_equal 1, sample_data_06.numbers.length
    assert sample_data_06.numbers.include? '58'

    assert sample_data_07.numbers.any?
    assert_equal 1, sample_data_07.numbers.length
    assert sample_data_07.numbers.include? '592'

    assert sample_data_08.numbers.any?
    assert_equal 1, sample_data_08.numbers.length
    assert sample_data_08.numbers.include? '755'

    assert sample_data_09.numbers.empty?

    assert sample_data_10.numbers.any?
    assert_equal 2, sample_data_10.numbers.length
    assert sample_data_10.numbers.include? '664'
    assert sample_data_10.numbers.include? '598'
  end
end
