require_relative 'lib/report'

safe_reports = 0
reports = Array.new()

File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  reports << line.split(' ')
  report = Report.new(line)
  if report.safe?
    safe_reports += 1
  end
end

puts "Safe reports: #{safe_reports}"
