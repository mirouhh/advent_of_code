class Machine

  attr_reader :indicator_lights

  def initialize
    @indicator_lights = []
  end

  def indicator_lights=(definition)
    @indicator_lights = definition[1...-1].chars
  end
end
