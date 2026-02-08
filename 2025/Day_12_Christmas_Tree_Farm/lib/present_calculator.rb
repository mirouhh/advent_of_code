# frozen_string_literal: true

class PresentCalculator

  def initialize()
    @presents = []
  end

  def empty?
    @presents.empty?
  end

  def add_present(present)
    @presents << present
  end
end
