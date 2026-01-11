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
end
