class Processor

  attr_reader :data

  def initialize
    @data = []
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

end
