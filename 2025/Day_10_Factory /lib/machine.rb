class Machine

  def initialize
    @indicator_lights = []
    @initial_state = []
    @button_wiring_schematics = []
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

  def button_wiring_schematics=(schematics)
    @button_wiring_schematics = schematics.scan(/\(([^)]+)\)/).flatten.map { |toggles| toggles.split(',').map(&:to_i) }
  end

  def button_wiring_schematics
    @button_wiring_schematics.map { |toggles| "(#{toggles.join(',')})" }.join(' ')
  end
end
