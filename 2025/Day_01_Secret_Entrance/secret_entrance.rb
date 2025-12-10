require_relative 'lib/safe_dial'

safeDial = SafeDial.new
safeDial.instructions = File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true)
safeDial.dial
puts "#{safeDial.zeros} zeros counted!"
