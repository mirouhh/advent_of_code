require_relative 'lib/report'

safe_reports = 0
reports = Array.new()

File.readlines("#{File.dirname(__FILE__)}/test_input.txt", chomp: true).each do |line|
  reports << line.split(' ')
  report = Report.new(line)
  puts "#{safe_reports} : #{report.inspect}"
  if report.safe?
    puts "Safe"
    safe_reports += 1
  end
end

puts "reports: #{reports}"
puts "Safe reports: #{safe_reports}"
