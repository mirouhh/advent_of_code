# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/present_calculator'
require_relative '../lib/present'

class PresentCalculatorTest < Minitest::Test

  def test_new_calculator_is_empty
    present_calculator = PresentCalculator.new
    assert present_calculator.empty?
  end

  def test_can_add_presents
    present_calculator = PresentCalculator.new
    assert present_calculator.empty?
    present_calculator.add_present(Present.new('.#.'))
    present_calculator.add_present(Present.new('#.#'))
    refute present_calculator.empty?
  end

  def test_can_import_data_from_file
    present_calculator = PresentCalculator.new
    asserrt present_calculator.empty?
    present_calculator.import("#{File.dirname(__FILE__)}/../sample_input.txt")
    refute present_calculator.empty?
  end

end
