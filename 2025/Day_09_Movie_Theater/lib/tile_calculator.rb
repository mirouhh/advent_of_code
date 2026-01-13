RedTile = Data.define(:col, :row)
GreenTile = Data.define(:col, :row)

class TileCalculator

  attr_reader :rectangles, :red_tiles, :green_tiles

  def initialize
    @red_tiles = []
    @rectangles = []
    @green_tiles = []
  end

  def empty?
    @red_tiles.empty? && @rectangles.empty? && @green_tiles.empty?
  end

  def add_red_tile(col, row)
    @red_tiles << RedTile.new(col, row)
  end

  def clean
    @red_tiles.clear
    @rectangles.clear
    @green_tiles.clear
  end

  def import(file)
    File.readlines("#{file}", chomp: true).reject(&:empty?).each do |line |
      x, y = line.split(',').map(&:to_i)
      add_red_tile(x, y)
    end
  end

  def calculate_rectangles
    @rectangles = @red_tiles.combination(2).map do | red_tile_1, red_tile_2 |
      ((red_tile_1.col - red_tile_2.col).abs + 1) * ((red_tile_1.row - red_tile_2.row).abs + 1)
    end
  end

  def max
    @rectangles.max
  end

  def add_green_tiles
    @red_tiles.empty? ? return : calculate_green_tiles
  end

  private

  def calculate_green_tiles
    row = @red_tiles.first.row
    puts "row: #{row}"
    puts "start_col: #{@red_tiles.first.col}"
    puts "end_col: #{@red_tiles.last.col}"
    ((@red_tiles.first.col + 1)...@red_tiles.last.col).each do |col|
      puts " adding green_tile in row: #{row} and col: #{col}"
      @green_tiles << GreenTile.new(row, col)
    end
  end

end
