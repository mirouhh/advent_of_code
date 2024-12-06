require_relative 'lib/report'
require_relative 'lib/problem_dampener'

safe_reports = []
reports = []

File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  reports << line.split(' ')
  report = Report.new(line)
  if report.safe?
    safe_reports << report.content
  else
    ProblemDampener.import(report)
    safe_reports << report.content if ProblemDampener.tolerable?
  end
end

puts "Safe reports: #{safe_reports.count}"

File.readlines("#{File.dirname(__FILE__)}/safe.txt", chomp: true).each do |line|
  safe_report = Report.new(line)
  safe_reports.include?(safe_report.content) ? safe_reports.delete(safe_report.content) : safe_reports << safe_report.content
end

puts "Missing reports: #{safe_reports.count}"

safe_reports.each { | safe_report | puts safe_report.join(' ') }
