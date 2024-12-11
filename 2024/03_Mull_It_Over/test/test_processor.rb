require 'minitest/autorun'

class TestProcessor < Minitest::Test

  def test_scan
    input = "mul(2,4)"
    Processor.scan(input)
    assert !Process.instructions.empty?
  end

end
