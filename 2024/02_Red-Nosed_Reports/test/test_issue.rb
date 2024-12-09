require 'minitest/autorun'
require_relative '../lib/issue'

class TestReport < Minitest::Test

  def test_equality
    assert_equal Issue.new(1, 2, 3), Issue.new(nil, 2, 3)
  end

end