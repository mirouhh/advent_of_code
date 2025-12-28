# frozen_string_literal: true

class Grid

  attr_reader :accessable_paper_rolls

  def initialize
    @shelfs = []
    @accessable_paper_rolls = []
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

  def adjacent_paper_rolls(paper_roll_position)
    positions_to_check(paper_roll_position).select do | position |
      valid_position?(position) && paper_roll_at?(position)
    end
  end

  def valid_position?(pos)
    shelf, position = pos
    shelf.between?(0, @shelfs.size - 1) && position.between?(0, @shelfs[shelf].length - 1)
  end

  def paper_roll_at?(pos)
    shelf, position = pos
    @shelfs[shelf][position] == '@'
  end


  def positions_to_check(paper_roll_position)
    shelf, position = paper_roll_position

    left = [shelf, position - 1]
    right = [shelf, position + 1]

    upper_left = [shelf - 1, position - 1]
    upper = [shelf - 1, position]
    upper_right = [shelf - 1, position + 1]

    lower_left = [shelf + 1, position - 1]
    lower = [shelf + 1, position]
    lower_right = [shelf + 1, position + 1]

    [left, right, upper_left, upper, upper_right, lower_left, lower, lower_right]
  end

  def accessable?(paper_roll)
    adjacent_paper_rolls(paper_roll).length < 4
  end

  def all_paper_roll_positions
    @shelfs.each_with_index.flat_map do |_, shelf_index|
      paper_rolls(shelf_index).map { |position| [shelf_index, position] }
    end
  end

  def find_accessable_paper_rolls
    @accessable_paper_rolls = all_paper_roll_positions.select { |paper_roll| accessable?(paper_roll) }
  end

  def pick_up_paper_rolls
    @accessable_paper_rolls.each { |paper_roll| @shelfs[paper_roll[0]][paper_roll[1]] = '.' }
  end

end
