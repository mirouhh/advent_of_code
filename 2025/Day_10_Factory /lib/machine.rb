class Machine

  def initialize
    @indicator_lights = []
    @current_state = []
    @button_wiring_schematics = []
    @joltage_requirements = []
    @counters = []
  end

  def indicator_lights=(definition)
    @indicator_lights = definition[1...-1].chars
    @current_state = ['.'] * @indicator_lights.length
  end

  def indicator_lights
    @indicator_lights
  end

  def indicator_lights_string
    @indicator_lights.empty? ? '' : "[#{indicator_lights.join}]"
  end

  def running?
    @current_state == @indicator_lights
  end

  def button_wiring_schematics=(schematics)
    @button_wiring_schematics = schematics.scan(/\(([^)]+)\)/).flatten.map { |toggles| toggles.split(',').map(&:to_i) }
  end

  def button_wiring_schematics
    @button_wiring_schematics
  end

  def button_wiring_schematics_string
    button_wiring_schematics.map { |toggles| "(#{toggles.join(',')})" }.join(' ')
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
    @counters = [0] * @joltage_requirements.length
  end

  def joltage_requirements
    @joltage_requirements
  end

  def joltage_requirements_string
    "{#{joltage_requirements.join(',')}}"
  end

  def to_s
    "#{indicator_lights_string} #{button_wiring_schematics_string} #{joltage_requirements_string}"
  end

  def press_buttons(button_index)
    apply_buttons_to_state(@current_state, button_index)
    return if @counters.empty?

    @button_wiring_schematics[button_index].each do |light|
      push_button(light)
    end
  end

  def apply_buttons_to_state(state, wiring_index)
    @button_wiring_schematics[wiring_index].each do |light|
      toggle_light(state, light)
    end
  end

  def toggle_light(state, index)
    state[index] = state[index] == '.' ? '#' : '.'
  end

  def counters
    @counters
  end

  def counters_data
    "{#{counters.join(',')}}"
  end

  def push_button(index)
    @counters[index] += 1
  end

  def increment_counter(state, index)
    state[index] += 1
  end

  def apply_buttons_to_counters(state, wiring_index)
    @button_wiring_schematics[wiring_index].each do |index|
      increment_counter(state, index)
    end
  end

end
