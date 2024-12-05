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

  def self.tolerable?
    tolerable = false
    @report.issues.each do | element |
      tmpContent = @report.content.dup
      tmpContent.delete_at(tmpContent.index(element))
      tmpReport = Report.new(tmpContent.join(" "))
      tolerable ||= tmpReport.safe?
    end
    tolerable
  end

end
