class Machine

  def initialize
    @indicator_lights = []
    @current_state = []
    @button_wiring_schematics = []
    @joltage_requirements = []
  end

  def indicator_lights=(definition)
    @indicator_lights = definition[1...-1].chars
    @current_state = ['.'] * @indicator_lights.length
  end

  def indicator_lights
    @indicator_lights.empty? ? '' : "[#{@indicator_lights.join}]"
  end

  def running?
    @current_state == @indicator_lights
  end

  def button_wiring_schematics=(schematics)
    @button_wiring_schematics = schematics.scan(/\(([^)]+)\)/).flatten.map { |toggles| toggles.split(',').map(&:to_i) }
  end

  def button_wiring_schematics
    @button_wiring_schematics.map { |toggles| "(#{toggles.join(',')})" }.join(' ')
  end

  def toggle(button)
    toggle_light(@current_state, button.to_i)
  end

  def current_state
    @current_state.join
  end

  def current_state=(state)
    @current_state = state.chars
  end

  def ready?
    !@indicator_lights.empty? && !@button_wiring_schematics.empty? && !@joltage_requirements.empty?
  end

  def joltage_requirements=(joltage_requirements)
    @joltage_requirements = joltage_requirements[1..-2].split(',').map(&:to_i)
  end

  def joltage_requirements
    "{#{@joltage_requirements.join(',')}}"
  end

  def to_s
    "#{indicator_lights} #{button_wiring_schematics} #{joltage_requirements}"
  end

  def press_buttons(button_index)
    apply_buttons_to_state(@current_state, button_index)
  end

  private

  def apply_buttons_to_state(state, wiring_index)
    @button_wiring_schematics[wiring_index].each do |light|
      toggle_light(state, light)
    end
  end

  def toggle_light(state, index)
    state[index] = state[index] == '.' ? '#' : '.'
  end

end
