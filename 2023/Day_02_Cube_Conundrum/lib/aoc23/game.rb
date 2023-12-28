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
end
