# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/present_calculator'

class PresentCalculatorTest < Minitest::Test

  def test_new_calculator_is_empty
    present_calculator = PresentCalculator.new
    assert present_calculator.empty?
  end

end
