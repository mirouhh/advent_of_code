JunctionBox = Data.define(:x, :y, :z)
Distance = Data.define(:value, :start, :end)

def calculation_info(circuit_calculator, connection_amount, top_circuit_size)
  circuit_calculator.connect_boxes(connection_amount)
  sizes = circuit_calculator.circuits.first(top_circuit_size).map(&:size).join(', ')
  product = circuit_calculator.multiply(top_circuit_size)

  <<~INFO
    #{circuit_calculator.junction_boxes.size} junction boxes imported.
    #{circuit_calculator.circuits.size} circuits found after #{connection_amount} connections.
    
    The largest circuits have the sizes #{sizes} which leads to #{product} as a result.

  INFO
end
