class Calculator

  def self.mul(a,b)
    a * b
  end

  def self.sum(a, *rest)
    result = a
    rest.each { |i| result += i }
    result
  end

end
