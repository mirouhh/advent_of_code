File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  numbers = line.split(' ')
  left_side << numbers[0].to_i
  right_side << numbers[1].to_i
end
