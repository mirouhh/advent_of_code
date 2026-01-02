require 'minitest/autorun'
require_relative '../lib/tachyon_manifold'

class TachyonManifoldTest < Minitest::Test

  def setup
    @tachyonManifold = TachyonManifold.new
  end

  def test_start_symbol
    assert @tachyonManifold.is_start?('S')
  end

  def test_space_symbol
    assert @tachyonManifold.is_space?('.')
  end

  def test_splitter_symbol
    assert @tachyonManifold.is_splitter?('^')
  end

  def test_beam_symbol
    assert @tachyonManifold.is_beam?('|')
  end

  def test_valid_symbols
    assert @tachyonManifold.valid_symbol?('S')
    assert @tachyonManifold.valid_symbol?('.')
    assert @tachyonManifold.valid_symbol?('^')
    assert @tachyonManifold.valid_symbol?('|')
    assert_equal 4, @tachyonManifold.valid_symbols.length
  end

end
