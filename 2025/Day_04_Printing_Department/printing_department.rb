require_relative 'lib/grid'

puts "####### PART ONE    ###############################"
puts "####### Sample Data ###############################"
grid = Grid.new
File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true).each do |shelf|
  puts "Importing shelf #{shelf}"
  grid.add(shelf)
end

puts "\n"
puts "The sample grid includes #{grid.accessable_paper_rolls.size} accessable paper rolls"

puts "\n\n"
puts "####### PART ONE    ###############################"
puts "####### Puzzle Data ###############################"

grid.clear
File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |shelf|
  puts "Importing shelf #{shelf}"
  grid.add(shelf)
end

puts "\n"
puts "The puzzle grid includes #{grid.accessable_paper_rolls.size} accessable paper rolls"

puts "\n\n"
puts "####### PART TWO    ###############################"
puts "####### Sample Data ###############################"
grid.clear
File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true).each do |shelf|
  puts "Importing shelf #{shelf}"
  grid.add(shelf)
end
grid.pick_up_all_accessable_paper_rolls

puts "\n"
puts "#{grid.picked_up_paper_rolls} paper roll(s) in total can be removed by the Elves and their forklifts"

puts "\n\n"
puts "####### PART TWO    ###############################"
puts "####### Puzzle Data ###############################"
grid.clear
File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |shelf|
  puts "Importing shelf #{shelf}"
  grid.add(shelf)
end
grid.pick_up_all_accessable_paper_rolls

puts "\n"
puts "#{grid.picked_up_paper_rolls} paper roll(s) in total can be removed by the Elves and their forklifts"
