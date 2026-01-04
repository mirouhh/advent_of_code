require 'minitest/autorun'
require_relative '../lib/junction_box'

class JunctionBoxTest < Minitest::Test

  def test_new_junction_box_doesnt_have_nil_values
    junction_box = JunctionBox.new(1,2,3)
    refute_nil junction_box.x
    refute_nil junction_box.y
    refute_nil junction_box.z
  end

end