class Processor

  @data = []

  class << self
    attr_reader :data
  end
  def self.read(input)

  end

  def self.clean_up
    @data = []
  end

end
