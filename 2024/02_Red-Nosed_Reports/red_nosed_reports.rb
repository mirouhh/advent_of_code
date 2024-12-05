require_relative 'lib/report'
require_relative 'lib/problem_dampener'

safe_reports = 0
reports = Array.new()

File.readlines("#{File.dirname(__FILE__)}/test_input.txt", chomp: true).each do |line|
  reports << line.split(' ')
  report = Report.new(line)
  if report.safe?
    safe_reports += 1
  else
    ProblemDampener.import(report)
    safe_reports += 1 if ProblemDampener.tolerable?
  end
end

puts "Safe reports: #{safe_reports}"
