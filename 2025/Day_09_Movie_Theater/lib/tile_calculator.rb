RedTile = Data.define(:row, :col)

class TileCalculator

  attr_reader :rectangles

  def initialize
    @red_tiles = []
    @rectangles = []
  end

  def empty?
    @red_tiles.empty? && @rectangles.empty?
  end

  def add_red_tile(row, col)
    @red_tiles << RedTile.new(row, col)
  end

  def clean
    @red_tiles.clear
    @rectangles.clear
  end

  def import(file)
    File.readlines("#{file}", chomp: true).reject(&:empty?).each do |line |
      x, y = line.split(',').map(&:to_i)
      add_red_tile(x, y)
    end
  end

  def calculate_rectangles
    @rectangles = @red_tiles.combination(2).map do | red_tile_1, red_tile_2 |
      ((red_tile_1.row - red_tile_2.row).abs + 1) * ((red_tile_1.col - red_tile_2.col).abs + 1)
    end
  end

  def max
    @rectangles.max
  end

end
