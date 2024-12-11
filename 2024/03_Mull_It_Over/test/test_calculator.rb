require 'minitest/autorun'
require_relative '../lib/calculator'

class TestCalculator < Minitest::Test

  def test_multiplication
    assert_equal 8, Calculator.mul(2,4)
  end

  def test_addition
    assert_equal 161, Calculator.sum(Calculator.mul(2,4), Calculator.mul(5,5), Calculator.mul(11,8), Calculator.mul(8,5))
  end

end# frozen_string_literal: true

