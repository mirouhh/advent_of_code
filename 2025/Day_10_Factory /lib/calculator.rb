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
    target = machine.indicator_lights.join

    queue = [[start, 0]]
    visited = { start => true }

    while !queue.empty?
      state, presses = queue.shift

      machine.button_wiring_schematics.each_index do |button_index|
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

  def sum
    @machines.reduce(0) { |sum, machine| sum + fewest_button_presses(machine) }
  end

  def import(file)
    File.readlines("#{file}", chomp: true).reject(&:empty?).each do |line |
      indicator_lights = line[/\[.*?\]/]
      joltage_requirements = line[/\{.*?\}/]
      button_wiring_schematics = line[(line.index(']') + 1)...(line.index('{'))].strip
      machine = Machine.new
      machine.indicator_lights = indicator_lights
      machine.button_wiring_schematics = button_wiring_schematics
      machine.joltage_requirements = joltage_requirements
      puts "Importing #{machine}"
      add(machine)
    end
  end

end
