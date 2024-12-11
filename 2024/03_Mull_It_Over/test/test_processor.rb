require 'minitest/autorun'
require_relative '../lib/processor'

class TestProcessor < Minitest::Test

  def test_scan_mul_2_by_4
    input = "mul(2,4)"
    Processor.scan(input)
    assert !Processor.instructions.empty?
    assert_equal ["mul(2,4)"], Processor.instructions
  end

  def test_scan_mul_5_by_5
    input = "mul(5,5)"
    Processor.scan(input)
    assert !Processor.instructions.empty?
    assert_equal ["mul(5,5)"], Processor.instructions
  end

  def test_scan_test_data
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    Processor.scan(input)
    assert !Processor.instructions.empty?
    assert_equal ["mul(2,4)", "mul(5,5)", "mul(11,8)", "mul(8,5)"], Processor.instructions
  end

  def test_process_test_data_part_one
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    Processor.scan(input)
    assert_equal 161, Processor.process
  end

  def test_process_test_data_part_two
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    Processor.scan_extended(input)
    assert_equal 48, Processor.process_extended
  end

end
