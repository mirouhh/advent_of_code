class InstructionImporter

  attr_reader :data, :instructions_part_one, :instructions_part_two

  def initialize()
    @data = []
    @instructions_part_one = []
    @instructions_part_two = []
  end

  def import(file)
    @data = File.readlines("#{file}", chomp: true).reject(&:empty?).then { |lines|
      max_length = lines.map(&:length).max
      lines.map { |line| line.ljust(max_length) }
    }
    extract_instructions_part_one
    extract_instructions_part_two
  end

  def reset
    @data.clear
    @instructions_part_one.clear
    @instructions_part_two.clear
  end

  def operator_positions
    @data[-1].chars.each_with_index.select { |char, idx|
      char == '+' || char == '*'
    }.map(&:last)
  end

  def max_data_length
    data.map(&:length).max
  end

  def data_ranges
    operator_positions.each_cons(2).map { |start, next_pos| start..(next_pos - 2) } << (operator_positions.last..max_data_length)
  end

  def operators_part_one
    operator_positions.map { | position | @data[-1][position] }
  end

  def numbers
    data[0..-2].map { |line|
      data_ranges.map { |range| line[range] }
    }
  end

  private
  def extract_instructions_part_one
    @instructions_part_one = numbers.map { |row| row.map(&:strip) }.transpose.zip(operators_part_one).map(&:flatten)
  end

  def extract_instructions_part_two
    operands = @data[0..-2].map { | line | line.split.reverse }.transpose
    operators = @data[-1].split.reverse

    @instructions_part_two = operands.zip(operators).map.with_index do |(tokens, operator), index|
      numbers = parse_cephalopod_numbers(tokens, index)
      numbers + [operator]
    end
  end

  def parse_cephalopod_numbers(tokens, index)
    # Alternate between left-aligned (even) and right-aligned (odd)
    tokens_to_parse = index.even? ? tokens : tokens.map(&:reverse)
    max_len = tokens_to_parse.map(&:length).max
    numbers = []

    (0...max_len).each do |col|
      digits = tokens_to_parse.map { |t| t.chars[col] }.compact.join
      numbers << digits unless digits.empty?
    end

    # Only reverse for even indices (left-aligned)
    index.even? ? numbers.reverse : numbers
  end

end
