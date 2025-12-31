class InstructionImporter

  attr_reader :data, :instructions_part_one

  def initialize()
    @data = []
    @instructions_part_one = []
  end

  def import(file)
    @data = File.readlines("#{file}", chomp: true).reject(&:empty?)
    extract_instructions_part_one
  end

  def reset
    @data.clear
    @instructions_part_one.clear
  end

  private
  def extract_instructions_part_one
    @instructions_part_one =@data[0..-2].map(&:split).transpose.zip(@data[-1].split).map(&:flatten)
  end

end
