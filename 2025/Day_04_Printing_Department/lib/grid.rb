# frozen_string_literal: true

class Grid

  def initialize
    @shelfs = []
  end

  def empty?
    @shelfs.empty?
  end

  def add(shelf)
    @shelfs << shelf
  end

  def paper_roll?(shelf)
    @shelfs[shelf].chars.any?('@')
  end

  def clear
    @shelfs.clear
  end

  def paper_rolls(shelf)
    @shelfs[shelf].chars.each_with_index.select { |char, index| char == '@' }.map(&:last)
  end

end
