class Array

  def indices(element=nil)
    positions = []
    self.each_with_index do |inner_element, index|
      positions << index if inner_element == element
    end
    positions
  end

end
