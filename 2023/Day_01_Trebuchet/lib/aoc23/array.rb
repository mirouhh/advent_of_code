require_relative 'string'

class Array
  def value
    empty? ? 0 : (self[0].to_digit + self[length - 1].to_digit).to_i
  end
end
