require 'minitest/autorun'
require_relative '../lib/processor'

class TestProcessor < Minitest::Test

  def test_read_data
    input = "E%X+GSL"
    Processor.read(input)
    assert_equal input, Processor.data.to_s
  end

  def test_clean_up_single_line_data
    input = "E%X+GSL"
    Processor.read(input)
    Processor.clean_up_data
    assert_equal ["..X...."], Processor.data
  end

end