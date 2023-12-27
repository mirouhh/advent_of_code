require 'minitest/autorun'
require_relative '../../lib/aoc23/string'

class StringTest < Minitest::Test
  def test_empty_array_is_returned_when_string_does_not_contain_numbers
    assert ''.int_array.empty?
    assert_equal 3, 'a1b2c3'.int_array.length
  end

  def test_int_array_contains_correct_numbers
    assert_equal [], ''.int_array
    assert_equal ['1'], 'a1'.int_array
    assert_equal ['1', '2'], 'a1b2'.int_array
    assert_equal ['1', '2', '3'], 'a1b2c3'.int_array
  end

  def test_converts_two1nine
    assert_equal ['two', '1', 'nine'], 'two1nine'.int_array
  end

  def test_converts_eightwothree
    assert_equal ['eight', 'two', 'three'], 'eightwothree'.int_array
  end

  def test_converts_abcone2threexyz
    assert_equal ['one', '2', 'three'], 'abcone2threexyz'.int_array
  end

  def test_converts_xtwone3four
    assert_equal ['two', 'one', '3', 'four'], 'xtwone3four'.int_array
  end

  def test_converts_4nineeightseven2
    assert_equal ['4', 'nine', 'eight', 'seven', '2'], '4nineeightseven2'.int_array
  end

  def test_converts_zoneight234
    assert_equal ['one', 'eight', '2', '3', '4'], 'zoneight234'.int_array
  end

  def test_converts_7pqrstsixteen
    assert_equal ['7', 'six'], '7pqrstsixteen'.int_array
  end

  def test_converts_string_to_digit
    strings_to_test = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
    corresponding_digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

    strings_to_test.each_with_index do |string_to_test, index|
      assert_equal corresponding_digits[index], string_to_test.to_digit
    end
  end
end
