class ProblemDampener

  def self.import(report)
    @report = report
    @report.decreasing?
    @report.increasing?
    @report.correct_distances?
  end

  def self.report
    @report
  end

  def self.check(index)
    content = self.remove_issue(index)
    report = Report.new(content.join(" "))
    report.safe?
  end

  def self.tolerable?
    tolerable = false
    @report.issues.each do | issue |
      tolerable = self.check(issue.index) ^ self.check(issue.index + 1)
      return tolerable if tolerable
    end
    tolerable
  end

  def self.remove_issue(index)
    content = @report.content.dup
    content.delete_at(index)
    content
  end

  def self.tolerable_decreasing_issues?
    decreasing_issues = @report.decreasing_issues
    decreasing_issues.empty?
    true
  end

end
