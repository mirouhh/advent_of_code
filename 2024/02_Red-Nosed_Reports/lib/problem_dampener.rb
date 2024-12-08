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
      element_index = tmpContent.index(element)
      tmpContent.delete_at(element_index)
      tmpReport = Report.new(tmpContent.join(" "))
      tolerable ||= tmpReport.safe?
    end
    tolerable
  end

end
