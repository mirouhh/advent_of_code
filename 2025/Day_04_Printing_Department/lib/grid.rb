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
      next if position < 0 || position >= @shelfs[shelf_no].length

      adjacent_paper_rolls << paper_roll if @shelfs[shelf_no].chars[position] == '@'
    end

    return adjacent_paper_rolls
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

  def accessable_paper_rolls
    accessable_paper_rolls = []
    @shelfs.each_with_index do |shelf, shelf_index|
      paper_rolls(shelf_index).each do |paper_roll_position|
        paper_roll = [shelf_index, paper_roll_position]
        accessable = accessable?(paper_roll)
        accessable_paper_rolls << paper_roll if accessable
      end
    end
    accessable_paper_rolls
  end

end
