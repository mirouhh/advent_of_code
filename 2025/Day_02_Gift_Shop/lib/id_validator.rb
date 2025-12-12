class IDValidator

  def self.import(range)
    @ids = range
  end

  def self.range
    @ids
  end

  def self.first_id
    @ids.split("-")[0]
  end

  def self.last_id
    @ids.split("-")[1]
  end

  def self.validate(range)
    false
  end
end
