class ProblemDampener

  def self.import(report)
    @report = report
  end

  def self.report
    @report
  end

  def self.tolerable?
    true
  end

  def self.issues
    [3]
  end
end
