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
    import(@lines_read, line)
  end

  def import(line_number, engine_schematic)
    import_numbers(line_number, engine_schematic)
    import_symbols(line_number, engine_schematic)
    @numbers.each do |number|
      @symbols.each do | symbol |
        @part_numbers << number if adjacent? number, symbol
      end
    end
    cleanup_numbers
    @lines_read = @lines_read + 1
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
    inline?(number, symbol) || above?(number, symbol) || diagonal?(number, symbol)
  end

  def inline? (number, symbol)
    interval = Range.new(number.x - 1, number.x + number.length + 1)
    interval.include? symbol.x
  end

  def above? (number, symbol)
    interval = Range.new(number.y - 1, number.y)
    (interval.include? symbol.y) && (number.x.eql? symbol.x)
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
end
