require_relative 'cube_set'

class Game
  attr_reader :id

  def initialize(id)
    @id = id
    @sets = []
  end

  def empty?
    @sets.empty?
  end

  def add_cube_set(cubeset)
    @sets << cubeset
  end

  def info
    info = "Game #{id}: "
    set_infos = []
    @sets.each do |set|
      set_infos << set.info
    end
    info + set_infos.join('; ')
  end

  def add_cube_sets(cube_sets)
    cube_sets.each do |cube_set|
      add_cube_set(cube_set)
    end
  end

  def self.create(data)
    data = data.chomp.downcase
    id = Game.get_id_from_import_data(data)
    game = Game.new(id)
    cube_sets = Game.get_cube_sets_from_import_data(data)
    game.add_cube_sets(cube_sets)
    game
  end

  def self.get_id_from_import_data(import_data)
    id_search_pattern = /\d/i
    partial_data = import_data.split(':')
    partial_data[0].scan(id_search_pattern).join.to_i
  end

  def self.get_cube_sets_from_import_data(import_data)
    cube_sets = []
    cube_sets_data = import_data.split(':')[1].split(';')
    cube_sets_data.each do |cube_set_data|
      cube_set = CubeSet.new
      cube_set.import(cube_set_data)
      cube_sets << cube_set
    end
    cube_sets
  end
end
