JunctionBox = Data.define(:x, :y, :z)
Distance = Data.define(:value, :start, :end)

def calculation_info_part_one(circuit_calculator, connection_amount, top_circuit_size)
  circuit_calculator.connect_boxes(connection_amount)
  sizes = circuit_calculator.circuits.first(top_circuit_size).map(&:size).join(', ')
  product = circuit_calculator.multiply(top_circuit_size)

  <<~INFO
    #{circuit_calculator.junction_boxes.size} junction boxes imported.
    #{circuit_calculator.circuits.size} circuits found after #{connection_amount} connections.
    
    The largest circuits have the sizes #{sizes} which leads to #{product} as a result.

  INFO
end

def calculation_info_part_two(circuit_calculator)
  circuit_calculator.connect_all
  start_x = circuit_calculator.last_connection.start.x
  end_x = circuit_calculator.last_connection.end.x
  product = circuit_calculator.last_connection_product

  "Multiplying the X coordinates of last two junction boxes (#{start_x} and #{end_x}) produces #{product}.\n\n"
end
