class InstructionImporter

  attr_reader :data

  def initialize()
    @data = []
  end

  def import(file)
    @data = File.readlines("#{file}", chomp: true).reject(&:empty?)
  end

  def reset
    @data.clear
  end

end
