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

  def adjacent_paper_rolls(paper_roll)
    shelf_no = paper_roll[0]
    position = paper_roll[1]

    adjacent_paper_rolls = []
    shelf_content = @shelfs[shelf_no].chars[position - 1]
    adjacent_paper_rolls << shelf_content if shelf_content == '@'

    shelf_content = @shelfs[shelf_no].chars[position + 1]
    adjacent_paper_rolls << shelf_content if shelf_content == '@'
  end
end
