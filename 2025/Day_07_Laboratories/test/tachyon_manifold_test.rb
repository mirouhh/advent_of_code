require 'minitest/autorun'
require_relative '../lib/tachyon_manifold'

class TachyonManifoldTest < Minitest::Test

  def test_start_symbol
    tachyonManifold = TachyonManifold.new
    assert_equal 'S', tachyonManifold.start_symbol
  end

  def test_space_symbol
    tachyonManifold = TachyonManifold.new
    assert_equal '.', tachyonManifold.space_symbol
  end

  def test_splitter_symbol
    tachyonManifold = TachyonManifold.new
    assert_equal '^', tachyonManifold.splitter_symbol
  end
  
end
