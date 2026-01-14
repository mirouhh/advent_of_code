class Machine

  def initialize
    @indicator_lights = []
    @initial_state = []
  end

  def indicator_lights=(definition)
    @indicator_lights = definition[1...-1].chars
    @initial_state = ['.'] * @indicator_lights.length
  end

  def indicator_lights
    @indicator_lights.empty? ? '' : "[#{@indicator_lights.join}]"
  end

  def running?
    @initial_state == @indicator_lights
  end
end
