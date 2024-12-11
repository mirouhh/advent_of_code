require 'minitest/autorun'

class TestCalculator < Minitest::Test

  def test_multiplication
    assert_equal 8, Calculator.mul(2,4)
  end

end# frozen_string_literal: true

