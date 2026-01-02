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

  def test_beam_symbol
    tachyonManifold = TachyonManifold.new
    assert_equal '|', tachyonManifold.beam_symbol
  end

  def test_valid_symbols
    tachyonManifold = TachyonManifold.new
    assert tachyonManifold.valid_symbol?('S')
    assert tachyonManifold.valid_symbol?('.')
    assert tachyonManifold.valid_symbol?('^')
    assert tachyonManifold.valid_symbol?('|')
    assert_equal 4, tachyonManifold.valid_symbols.length
  end

end
