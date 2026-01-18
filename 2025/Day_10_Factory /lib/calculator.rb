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

end
