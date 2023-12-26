class Array
  def value
    empty? ? 0 : (self[0] + self[length - 1]).to_i
  end
end
