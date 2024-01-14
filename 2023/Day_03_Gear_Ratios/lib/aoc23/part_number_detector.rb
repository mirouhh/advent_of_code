require_relative 'string'

class PartNumberDetector

  attr_reader :numbers, :symbols, :part_numbers

  def initialize
    @part_numbers = []
    @symbols = []
    @numbers = []
    @lines_read = 0
  end

  def import_line(line)
    import(line)
  end

  def import_lines(lines)
    lines.each do | line |
      import_line line
    end
  end

  def import(engine_schematic)
    import_numbers(@lines_read, engine_schematic)
    import_symbols(@lines_read, engine_schematic)
    @lines_read = @lines_read + 1
  end

  def process_data
    @numbers.each do |number|
      #puts "\nValidating Part Number Candidate: #{number.to_s}"
      is_adjacent = false
      @symbols.each do | symbol |
        is_this_symbol_adjacent = adjacent? number, symbol
        # puts "Is it adjacent to #{symbol.to_s}? #{is_this_symbol_adjacent}"
        is_adjacent |= is_this_symbol_adjacent
      end
      #puts "Is #{number.to_s} a vaild part number? #{is_adjacent}"
      #puts "-----------------------------------------------------\n"
      @part_numbers << number if is_adjacent
    end
    cleanup_numbers
  end

  def cleanup_numbers
    @part_numbers.each do | part_number |
      @numbers.delete part_number
    end
  end

  def import_symbols(line_number, engine_schematic)
    engine_schematic.symbols.each do | symbol |
      @symbols << EngineSchematicSymbol.new(symbol, engine_schematic.index(symbol), line_number)
    end
  end

  def import_numbers(line_number, engine_schematic)
    engine_schematic.numbers.each do | number |
      @numbers << PartNumberCandidate.new(number.to_i, engine_schematic.index(number), line_number)
    end
  end

  def contains_numbers_only?
    @numbers.all? {|number | number.class == PartNumberCandidate}
  end

  def has_valid_part_numbers?
    @part_numbers.any?
  end

  def has_symbols?
    @symbols.any?
  end

  def adjacent?(number, symbol)
    inline?(number, symbol) || above?(number, symbol) || below?(number, symbol) || diagonal?(number, symbol)
  end

  def inline? (number, symbol)
    interval = Range.new(number.x - 1, number.x + number.length + 1)
    number.y.eql?(symbol.y) && interval.include?(symbol.x)
  end

  def above?(number, symbol)
    interval = Range.new(number.x, number.x + number.length - 1)
    (interval.include? symbol.x) && (number.y.eql?(symbol.y + 1))
  end

  def below?(number, symbol)
    interval = Range.new(number.x, number.x + number.length + 1)
    (interval.include? symbol.x) && (number.y.eql?(symbol.y - 1))
  end

  def diagonal?(number, symbol)
    # Is lower left
    lower_left = symbol.x.eql?(number.x - 1) && symbol.y.eql?(number.y - 1)
    # Is upper left
    upper_left = symbol.x.eql?(number.x - 1) && symbol.y.eql?(number.y + 1)
    # Is upper right
    upper_right = symbol.x.eql?(number.x + number.length) && symbol.y.eql?(number.y + 1)
    # Is lower left
    lower_right = symbol.x.eql?(number.x + number.length) && symbol.y.eql?(number.y - 1)
    lower_left || upper_left || upper_right || lower_right
  end

  def sum
    sum = 0
    @part_numbers.each do | part_number |
      sum = sum + part_number.value
    end
    sum
  end
end
