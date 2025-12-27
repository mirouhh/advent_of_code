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

  def adjacent_paper_rolls(paper_roll_position)
    adjacent_paper_rolls = []

    positions_to_check(paper_roll_position).each do | paper_roll |
      shelf_no = paper_roll[0]
      position = paper_roll[1]

      next if shelf_no < 0 || shelf_no >= @shelfs.size

      adjacent_paper_rolls << paper_roll if @shelfs[shelf_no].chars[position] == '@'
    end

    return adjacent_paper_rolls
  end

  def positions_to_check(paper_roll_position)
    shelf, position = paper_roll_position
    positions_to_check = []

    left = [shelf, position - 1]
    right = [shelf, position + 1]

    upper_left = [shelf - 1, position - 1]
    upper = [shelf - 1, position]
    upper_right = [shelf - 1, position + 1]

    positions_to_check = [left, right, upper_left, upper, upper_right]
  end
end
