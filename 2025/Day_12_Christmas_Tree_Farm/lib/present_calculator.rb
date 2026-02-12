# frozen_string_literal: true

class PresentCalculator

  def initialize()
    @presents = []
    @regions = []
  end

  def empty?
    @presents.empty? && @regions.empty?
  end

  def add_present(present)
    @presents << present
  end

  def add_region(region)
    @regions << region
  end

  def import(file)
    data = []
    File.readlines("#{file}", chomp: true).each do |line |
      if line.empty?
        process(data)
        data.clear
      else
        data << line
      end
    end
  end

  private

  def process(data)
    data[0].include?("x") ? process_region(data) : process_present(data)
  end

  def process_region(region_data)
    @regions << data
  end

  def process_present(present_data)
    @presents << data
  end

end
