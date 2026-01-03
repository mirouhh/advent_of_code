require 'minitest/autorun'
require_relative '../lib/tachyon_manifold'

class TachyonManifoldTest < Minitest::Test

  def setup
    @tachyonManifold = TachyonManifold.new
    @start = 'S'
    @space = '.'
    @splitter = '^'
    @beam = '|'
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
    @tachyonManifold.start = @start
    assert @tachyonManifold.start?('S')
  end

  def test_space_symbol
    @tachyonManifold.space = @space
    assert @tachyonManifold.space?('.')
  end

  def test_splitter_symbol
    @tachyonManifold.splitter = @splitter
    assert @tachyonManifold.splitter?('^')
  end

  def test_beam_symbol
    @tachyonManifold.beam = @beam
    assert @tachyonManifold.beam?('|')
  end

  def test_valid_symbols
    @tachyonManifold.start = @start
    @tachyonManifold.space = @space
    @tachyonManifold.splitter = @splitter
    @tachyonManifold.beam = @beam
    assert @tachyonManifold.valid?('S')
    assert @tachyonManifold.valid?('.')
    assert @tachyonManifold.valid?('^')
    assert @tachyonManifold.valid?('|')
    assert_equal 4, @tachyonManifold.symbols.length
  end

  def test_import_diagram
    @tachyonManifold.import(@diagram)
    assert_equal 6, @tachyonManifold.diagram.size
    assert_equal @diagram, @tachyonManifold.diagram
  end

  def test_start_position
    @tachyonManifold.start = @start
    @tachyonManifold.import(@diagram)
    assert_equal [0,7], @tachyonManifold.start_position
  end

  def test_symbols_can_be_set
    @tachyonManifold.start = @start
    @tachyonManifold.space = @space
    @tachyonManifold.splitter = @splitter
    @tachyonManifold.beam = @beam
    assert_equal ['S', '.', '^', '|'], @tachyonManifold.symbols
  end

end
