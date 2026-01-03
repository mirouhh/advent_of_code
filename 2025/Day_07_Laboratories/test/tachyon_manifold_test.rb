require 'minitest/autorun'
require_relative '../lib/tachyon_manifold'

class TachyonManifoldTest < Minitest::Test

  def setup
    @tachyonManifold = TachyonManifold.new
    @diagram = [
      '.......S.......',
      '.......|.......',
      '......|^|......',
      '......|.|......',
      '.....|^|^|.....',
      '.....|.|.|.....',
    ]
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

  def test_import_diagram
    @tachyonManifold.import(@diagram)
    assert_equal 6, @tachyonManifold.diagram.size
    assert_equal @diagram, @tachyonManifold.diagram
  end

  def test_start_position
    @tachyonManifold.import(@diagram)
    assert_equal [0,7], @tachyonManifold.start_position
  end

end
