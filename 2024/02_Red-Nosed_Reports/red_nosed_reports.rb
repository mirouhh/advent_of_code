require_relative 'lib/report'
require_relative 'lib/problem_dampener'

reports = []
safe_reports = []
tolerable_reports = []
defect_reports = []

File.readlines("#{File.dirname(__FILE__)}/safe.txt", chomp: true).each do |line|
  report = Report.new(line)
  reports << report
  #puts "Is report #{report.content} safe? #{report.safe?}"
  if report.safe?
    safe_reports << report
  else
    ProblemDampener.import(report)
    #  puts "Is #{report.content} tolerable? #{ProblemDampener.tolerable?}"
    ProblemDampener.tolerable? ? tolerable_reports << report : defect_reports << report
  end
end

puts "Reports checked in total: #{reports.count}"
puts "Safe reports: #{safe_reports.count}"
puts "Tolerable reports: #{tolerable_reports.count}"
puts "Defect reports: #{defect_reports.count}"

defect_reports.each do |defect_report|
  puts "#{defect_report.content}"
end
