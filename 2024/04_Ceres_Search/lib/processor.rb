class Processor

  attr_reader :data

  def initialize
    @data = []
    @count = 0
  end

  def read(input)
    @data << input.chars
  end

  def clean_up
    @data = []
  end

  def clean_up_data
    @data.each do |line|
      line.each_with_index do |char, index|
        line[index] = '.' if !['X', 'M', 'A', 'S'].include? char
      end
    end
  end

  def count(element)
    data.each do |line|
      @count += line.count(element)
    end
    @count
  end

  def find(word)
    2
  end
end
