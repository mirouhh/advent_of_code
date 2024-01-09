class EngineSchematicSymbol

  attr_reader :value, :x, :y
  
  def initialize(value, x, y)
    @value = value
    @x = x
    @y = y
  end
end
