class IDValidator

  def self.import(range)
    ids = range.split("-").map(&:to_i)
    @first_id = ids[0]
    @last_id = ids[1]
    @range = (first_id..last_id).map(&:to_s)
    @invalid_ids = []
  end

  def self.range
    @range
  end

  def self.first_id
    @first_id.to_s
  end

  def self.last_id
    @last_id.to_s
  end

  def self.validate(range)
    valid = true
    import(range)
    @range.each do |id|
      valid &= self.valid?(id)
    end
    valid
  end

  def self.valid?(id)
    return false if (id[0] == "0")
    half = id.length / 2
    valid = id[0, half] != id[half, id.length]
    @invalid_ids << id unless valid
    valid
  end

  def self.invalid_ids
    @invalid_ids
  end

  def self.sum
    @invalid_ids.map(&:to_i).sum
  end
end
