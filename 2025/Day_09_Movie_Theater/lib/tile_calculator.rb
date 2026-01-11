RedTile = Data.define(:row, :col)

class TileCalculator

  def initialize
    @red_tiles = []
  end

  def empty?
    @red_tiles.empty?
  end

  def add_red_tile(row, col)
    @red_tiles << RedTile.new(row, col)
  end

  def clean
    @red_tiles.clear
  end

  def import(file)
    File.readlines("#{file}", chomp: true).reject(&:empty?).each do |line |
      x, y = line.split(',').map(&:to_i)
      add_red_tile(x, y)
    end
  end
end
