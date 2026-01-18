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
    fewest_presses(
      start: machine.current_state,
      target: machine.indicator_lights.join,
      machine: machine
    ) do |state, button_index|
      new_state = state.chars
      machine.apply_buttons_to_state(new_state, button_index)
      new_state.join
    end
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
      add(machine)
    end
  end

  def clear
    @machines.clear
  end

  def to_s
    <<~INFO

    Imported machines:
    #{@machines.join("\n")}.

    The fewest button presses required to correctly configure the indicator lights on all of the machines is #{sum}.

    INFO
  end

  def fewest_button_presses_for_joltage_requirements(machine)
    fewest_presses(
      start: machine.counters.dup,
      target: machine.joltage_requirements,
      machine: machine
    ) do |state, button_index|
      new_state = state.dup
      machine.apply_buttons_to_counters(new_state, button_index)
      new_state
    end
  end

  private

  def fewest_presses(start:, target:, machine:)
    return 0 if start == target

    queue = [[start, 0]]
    visited = { start => true }

    while !queue.empty?
      state, presses = queue.shift

      machine.button_wiring_schematics.each_index do |button_index|
        new_state = yield(state, button_index)

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
