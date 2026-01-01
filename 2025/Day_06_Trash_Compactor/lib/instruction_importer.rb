class InstructionImporter

  attr_reader :data, :instructions_part_one, :instructions_part_two

  def initialize()
    @data = []
    @instructions_part_one = []
    @instructions_part_two = []
  end

  def import(file)
    @data = File.readlines("#{file}", chomp: true).reject(&:empty?)
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

  private
  def extract_instructions_part_one
    @instructions_part_one = @data[0..-2].map(&:split).transpose.zip(@data[-1].split).map(&:flatten)
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
