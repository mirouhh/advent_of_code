require_relative 'string'

class PartNumberDetector

  def initialize
    @part_numbers = []
    @symbols = []
    @numbers = []
  end

  def import(line_number, engine_schematic)
    @symbols = engine_schematic.symbols unless engine_schematic.symbols.empty?
    @numbers = engine_schematic.numbers
    @numbers.each do |number|
      @symbols.each do | symbol |
        @part_numbers << number if adjacent? number, symbol
      end
    end
  end

  def has_valid_part_numbers?
    @part_numbers.any?
  end

  def has_symbols?
    @symbols.any?
  end

  def adjacent?(number, symbol)
    inline?(number, symbol) || above?(number, symbol)
  end

  def inline? (number, symbol)
    interval = Range.new(number.x - 1, number.x + number.length + 1)
    interval.include? symbol.x
  end

  def above? (number, symbol)
    interval = Range.new(number.y - 1, number.y)
    (interval.include? symbol.y) && (number.x.eql? symbol.x)
  end
end
