# frozen_string_literal: true
left_side = Array.new
right_side = Array.new
distances = Array.new
similarities = Array.new

File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  numbers = line.split(' ')
  left_side << numbers[0].to_i
  right_side << numbers[1].to_i
end

left_side.sort!
right_side.sort!

# puts "The left side is #{left_side.inspect}."
# puts "The right side is #{right_side.inspect}."

left_side.each_index { |index| distances << (left_side[index] - right_side[index]).abs }

puts "The total distance is #{distances.sum}."

left_side.each_index { |index| similarities << left_side[index] * right_side.select { |element| element == left_side[index]}.size }

puts "The similarity score is #{similarities.sum}."