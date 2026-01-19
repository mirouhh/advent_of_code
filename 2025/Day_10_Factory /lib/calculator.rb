require 'fiddle'
require 'fiddle/import'

# GLPK C-Bibliothek Bindings für Integer Linear Programming
module GLPK
  extend Fiddle::Importer

  LIB_PATHS = [
    '/usr/lib/x86_64-linux-gnu/libglpk.so',
    '/usr/lib/libglpk.so',
    '/usr/local/lib/libglpk.so',
    '/opt/homebrew/lib/libglpk.dylib',
    '/usr/local/opt/glpk/lib/libglpk.dylib'
  ].freeze

  LIB_PATH = LIB_PATHS.find { |p| File.exist?(p) }

  if LIB_PATH
    dlload LIB_PATH

    # GLPK Konstanten
    GLP_MIN = 1
    GLP_LO = 2
    GLP_FX = 5
    GLP_IV = 2
    GLP_OPT = 5
    GLP_FEAS = 2
    GLP_MSG_OFF = 0

    # GLPK Funktionen
    extern 'void* glp_create_prob()'
    extern 'void glp_delete_prob(void*)'
    extern 'void glp_set_obj_dir(void*, int)'
    extern 'int glp_add_rows(void*, int)'
    extern 'int glp_add_cols(void*, int)'
    extern 'void glp_set_row_bnds(void*, int, int, double, double)'
    extern 'void glp_set_col_bnds(void*, int, int, double, double)'
    extern 'void glp_set_obj_coef(void*, int, double)'
    extern 'void glp_set_col_kind(void*, int, int)'
    extern 'void glp_load_matrix(void*, int, int*, int*, double*)'
    extern 'int glp_simplex(void*, void*)'
    extern 'int glp_intopt(void*, void*)'
    extern 'int glp_mip_status(void*)'
    extern 'double glp_mip_obj_val(void*)'
    extern 'void glp_init_iocp(void*)'

    IOCP_SIZE = 512

    def self.available?
      true
    end
  else
    def self.available?
      false
    end
  end
end

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
    sum_1 = @machines.reduce(0) { |sum, machine| sum + fewest_button_presses(machine) }
    sum_2 = @machines.reduce(0) { |sum, machine| sum + fewest_button_presses_for_joltage_requirements(machine) }
    [sum_1, sum_2]
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

    The fewest button presses required to correctly configure the indicator lights on all of the machines is #{sum.first}.
    The fewest button presses required to correctly configure the indicator lights on all of the machines using the joltage requirements is #{sum.last}.

    INFO
  end

  def fewest_button_presses_for_joltage_requirements(machine)
    return fewest_button_presses_for_joltage_requirements_bfs(machine) unless GLPK.available?

    solve_with_ilp(machine)
  end

  def fewest_button_presses_for_joltage_requirements_bfs(machine)
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

  def solve_with_ilp(machine)
    buttons = machine.button_wiring_schematics
    target = machine.joltage_requirements

    n_buttons = buttons.length
    n_counters = target.length

    prob = GLPK.glp_create_prob
    return -1 if prob.null?

    begin
      GLPK.glp_set_obj_dir(prob, GLPK::GLP_MIN)

      # Variablen (Spalten): Anzahl Drücke pro Button
      GLPK.glp_add_cols(prob, n_buttons)
      n_buttons.times do |j|
        col = j + 1
        GLPK.glp_set_col_bnds(prob, col, GLPK::GLP_LO, 0.0, 0.0)
        GLPK.glp_set_obj_coef(prob, col, 1.0)
        GLPK.glp_set_col_kind(prob, col, GLPK::GLP_IV)
      end

      # Constraints (Zeilen): Button-Effekte = Zielwerte
      GLPK.glp_add_rows(prob, n_counters)
      n_counters.times do |i|
        GLPK.glp_set_row_bnds(prob, i + 1, GLPK::GLP_FX, target[i].to_f, target[i].to_f)
      end

      # Matrix: welcher Button beeinflusst welchen Counter
      elements = []
      n_counters.times do |i|
        n_buttons.times do |j|
          count = buttons[j].count(i)
          elements << [i + 1, j + 1, count.to_f] if count > 0
        end
      end

      ne = elements.length
      ia = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT * (ne + 1))
      ja = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT * (ne + 1))
      ar = Fiddle::Pointer.malloc(Fiddle::SIZEOF_DOUBLE * (ne + 1))

      elements.each_with_index do |(row, col, val), k|
        idx = k + 1
        ia[idx * Fiddle::SIZEOF_INT, Fiddle::SIZEOF_INT] = [row].pack('i')
        ja[idx * Fiddle::SIZEOF_INT, Fiddle::SIZEOF_INT] = [col].pack('i')
        ar[idx * Fiddle::SIZEOF_DOUBLE, Fiddle::SIZEOF_DOUBLE] = [val].pack('d')
      end

      GLPK.glp_load_matrix(prob, ne, ia, ja, ar)

      # Solver konfigurieren und ausführen
      iocp = Fiddle::Pointer.malloc(GLPK::IOCP_SIZE)
      GLPK.glp_init_iocp(iocp)
      iocp[0, Fiddle::SIZEOF_INT] = [GLPK::GLP_MSG_OFF].pack('i')

      old_stdout = $stdout.dup
      $stdout.reopen('/dev/null', 'w')
      begin
        GLPK.glp_simplex(prob, nil)
        GLPK.glp_intopt(prob, iocp)
      ensure
        $stdout.reopen(old_stdout)
      end

      status = GLPK.glp_mip_status(prob)
      if status == GLPK::GLP_OPT || status == GLPK::GLP_FEAS
        GLPK.glp_mip_obj_val(prob).round.to_i
      else
        -1
      end
    ensure
      ia&.free
      ja&.free
      ar&.free
      iocp&.free
      GLPK.glp_delete_prob(prob)
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
