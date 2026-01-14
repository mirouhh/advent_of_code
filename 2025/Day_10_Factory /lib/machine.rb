class Machine

  def initialize
    @indicator_lights = []
  end

  def indicator_lights=(definition)
    @indicator_lights = definition[1...-1].chars
  end

  def indicator_lights
    @indicator_lights.empty? ? '' : "[#{@indicator_lights.join}]"
  end
end
