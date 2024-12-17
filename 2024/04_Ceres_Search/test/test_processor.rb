require 'minitest/autorun'
require_relative '../lib/processor'

class TestProcessor < Minitest::Test

  def test_read_data
    input = 'E%X+GSL'
    processor = Processor.new()
    processor.read(input)
    assert_equal input, processor.data.join.to_s
  end

  def test_clean_up_single_line_data
    input = 'E%X+GSL'
    processor = Processor.new()
    processor.read(input)
    processor.clean_up_data
    assert_equal '..X..S.', processor.data[0].join
  end

  def test_clean_up
    input = 'E%X+GSL'
    processor = Processor.new
    processor.read(input)
    processor.clean_up
    assert_empty processor.data
  end

end