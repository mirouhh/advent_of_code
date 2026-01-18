# frozen_string_literal: true

class Calculator

  def initialize
    @machines = []
  end

  def empty?
    @machines.empty?
  end

  def add(machine)
    @machines << machine
  end

  def fewest_button_presses(machine)
    return 0 if machine.running?

    start = machine.current_state
    target = machine.indicator_lights[1..-2]

    queue = [[start, 0]]
    visited = { start => true }

    button_wiring_schematics = machine.button_wiring_schematics.scan(/\(([^)]+)\)/).flatten.map { |toggles| toggles.split(',').map(&:to_i) }

    while !queue.empty?
      state, presses = queue.shift

      button_wiring_schematics.each_index do |button_index|
        new_state = state.chars
        machine.apply_buttons_to_state(new_state, button_index)
        new_state = new_state.join

        return presses + 1 if new_state == target

        unless visited[new_state]
          visited[new_state] = true
          queue << [new_state, presses + 1]
        end
      end
    end

    -1
  end

end
