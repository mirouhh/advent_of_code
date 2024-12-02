# frozen_string_literal: true
left_side = Array.new
right_side = Array.new
distances = Array.new

File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  numbers = line.split(' ')
  left_side << numbers[0].to_i
  right_side << numbers[1].to_i
end

left_side.sort!
right_side.sort!

left_side.each_index { |index| distances << (left_side[index] - right_side[index]).abs }

puts distances.sum
