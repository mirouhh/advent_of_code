require 'minitest/autorun'
require_relative '../lib/processor'
require_relative '../lib/position'

class TestProcessor < Minitest::Test

  def test_read_data
    input = 'E%X+GSL'
    processor = Processor.new()
    processor.read(input)
    assert_equal input, processor.data.join.to_s
  end

  def test_clean_up_single_line_data
    input = 'E%X+GSL'
    processor = Processor.new()
    processor.read(input)
    processor.clean_up_data
    assert_equal '..X..S.', processor.data[0].join
  end

  def test_clean_up
    input = 'E%X+GSL'
    processor = Processor.new
    processor.read(input)
    processor.clean_up
    assert_empty processor.data
  end

  def test_read_multiple_line_data
    line_1 = 'NWX&/1'
    line_2 = 'OSAMXT'
    line_3 = 'IAJFAD'
    line_4 = 'XMASVS'
    line_5 = 'YXCWRL'
    processor = Processor.new()
    processor.read(line_1)
    processor.read(line_2)
    processor.read(line_3)
    processor.read(line_4)
    processor.read(line_5)
    assert_equal [line_1.chars, line_2.chars, line_3.chars, line_4.chars, line_5.chars], processor.data
  end

  def test_clean_up_multiple_line_data
    line_1 = 'NWX&/1'
    line_2 = 'OSAMXT'
    line_3 = 'IAJFAD'
    line_4 = 'XMASVS'
    line_5 = 'YXCWRL'
    processor = Processor.new()
    processor.read(line_1)
    processor.read(line_2)
    processor.read(line_3)
    processor.read(line_4)
    processor.read(line_5)
    processor.clean_up_data
    assert_equal ['..X...'.chars, '.SAMX.'.chars, '.A..A.'.chars, 'XMAS.S'.chars, '.X....'.chars], processor.data
  end

  def test_count_x
    line_1 = 'NWX&/1'
    line_2 = 'OSAMXT'
    line_3 = 'IAJFAD'
    line_4 = 'XMASVS'
    line_5 = 'YXCWRL'
    processor = Processor.new()
    processor.read(line_1)
    processor.read(line_2)
    processor.read(line_3)
    processor.read(line_4)
    processor.read(line_5)
    processor.clean_up_data
    assert_equal 4, processor.count('X')
  end

  def test_find_all_xmas
    line_1 = 'NWX&/1'
    line_2 = 'OSAMXT'
    line_3 = 'IAJFAD'
    line_4 = 'XMASVS'
    line_5 = 'YXCWRL'
    processor = Processor.new()
    processor.read(line_1)
    processor.read(line_2)
    processor.read(line_3)
    processor.read(line_4)
    processor.read(line_5)
    processor.clean_up_data
    assert_equal 4, processor.find('XMAS')
  end

  def test_get_position
    line = 'NWX&/1'
    processor = Processor.new()
    processor.read(line)
    processor.clean_up_data
    positions = processor.positions('X')
    assert_equal 1, positions.count
    assert_includes positions, Position.new(2, 0)
  end

  def test_get_multiple_positions_in_a_single_line
    line = 'IAJFAD'
    processor = Processor.new()
    processor.read(line)
    processor.clean_up_data
    positions = processor.positions('A')
    assert_equal 2, positions.count
    assert_includes positions, Position.new(1, 0)
    assert_includes positions, Position.new(4, 0)
  end

  def test_get_multiple_positions_in_multiples_lines
    line_0 = 'NWX&/1'
    line_1 = 'OSAMXT'
    line_2 = 'IAJFAD'
    line_3 = 'XMASVS'
    line_4 = 'YXCWRL'
    processor = Processor.new()
    processor.read(line_0)
    processor.read(line_1)
    processor.read(line_2)
    processor.read(line_3)
    processor.read(line_4)
    processor.clean_up_data
    positions = processor.positions('X')
    assert_equal 4, positions.count
    assert_includes positions, Position.new(2, 0)
    assert_includes positions, Position.new(4, 1)
    assert_includes positions, Position.new(0, 3)
    assert_includes positions, Position.new(1, 4)
  end

  def test_find_vertical_non_reverse_xmas
    line_0 = 'NWX&/1'
    line_1 = 'OSAMXT'
    line_2 = 'IAJFAD'
    line_3 = 'XMASVS'
    line_4 = 'YXCWRL'
    processor = Processor.new()
    processor.read(line_0)
    processor.read(line_1)
    processor.read(line_2)
    processor.read(line_3)
    processor.read(line_4)
    processor.clean_up_data
    processor.find('XMAS')
    assert_equal 1, processor.word_count
  end

  def test_find_valid_character
    line = 'XMASVS'
    processor = Processor.new()
    processor.read(line)
    processor.clean_up_data
    assert processor.valid?('S',Position.new(5, 0))
  end
end
