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
    @instructions_part_one = extract_instructions(operands_part_one, operators_part_one)
    @instructions_part_two = extract_instructions(operands_part_two, operators_part_two)
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

  def operators_part_two
    operators_part_one.reverse
  end

  def numbers
    data[0..-2].map { |line|
      data_ranges.map { |range| line[range] }
    }
  end

  def operands_part_one
    numbers.map { |row| row.map(&:strip) }.transpose
  end

  def operands_part_two
    columns = numbers.transpose.reverse  # Von rechts nach links durch die Spalten

    columns.map do |column|
      # column ist ein Array von Strings wie ["64 ", "23 ", "314"]
      # Wir lesen diese spaltenweise (vertikal)
      max_len = column.map(&:length).max

      result = (0...max_len).map do |i|
        # Alle Zeichen an Position i aus allen Strings
        digits = column.map { |str| str[i] }.compact.join.strip
        digits unless digits.empty?
      end.compact

      result.reverse
    end
  end

  private

  def extract_instructions(operands, operators)
    operands.zip(operators).map(&:flatten)
  end

end
