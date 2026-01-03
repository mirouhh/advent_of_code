require 'minitest/autorun'
require_relative '../lib/tachyon_manifold'

class TachyonManifoldTest < Minitest::Test

  def setup
    @tachyonManifold = TachyonManifold.new
  end

  def test_start_symbol
    assert @tachyonManifold.start?('S')
  end

  def test_space_symbol
    assert @tachyonManifold.space?('.')
  end

  def test_splitter_symbol
    assert @tachyonManifold.splitter?('^')
  end

  def test_beam_symbol
    assert @tachyonManifold.beam?('|')
  end

  def test_valid_symbols
    assert @tachyonManifold.valid?('S')
    assert @tachyonManifold.valid?('.')
    assert @tachyonManifold.valid?('^')
    assert @tachyonManifold.valid?('|')
    assert_equal 4, @tachyonManifold.valid_symbols.length
  end

  def test_import
    assert @tachyonManifold.add('.......S.......')
    assert_equal [['.', '.', '.', '.', '.', '.', 'S', '.', '.', '.', '.', '.']], @tachyonManifold.diagram
  end

end
