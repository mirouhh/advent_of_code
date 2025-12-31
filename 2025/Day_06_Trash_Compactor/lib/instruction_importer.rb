class InstructionImporter

  attr_reader :data, :instructions_part_one, :instructions_part_two

  def initialize()
    @data = []
    @instructions_part_one = []
    @instructions_part_two = []
  end

  def import(file)
    @data = File.readlines("#{file}", chomp: true).reject(&:empty?)
    extract_instructions_part_one
    extract_instructions_part_two
  end

  def reset
    @data.clear
    @instructions_part_one.clear
    @instructions_part_two.clear
  end

  private
  def extract_instructions_part_one
    @instructions_part_one = @data[0..-2].map(&:split).transpose.zip(@data[-1].split).map(&:flatten)
  end

  def extract_instructions_part_two
    @instructions_part_two = @instructions_part_one
  end

end
