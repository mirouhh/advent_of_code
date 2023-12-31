require_relative 'lib/aoc23/calculator'

calculator = Calculator.new
bag = Bag.new
bag.import('12 red, 13 green, 14 blue')
games_found = 0
games_to_check = []
File.readlines(File.dirname(__FILE__) + '/input.txt').each do |line|
  games_to_check << Game.create(line)
  games_found += 1
end

calculator.check(games_to_check, bag)

puts '### Part I ###' + ('#'* 106)
puts "Games found: #{games_found}"
puts "Games possible: #{calculator.possible_games.length}"
puts "Games impossible: #{calculator.impossible_games.length}"
puts "The total sum of the possible game ids from the input file is #{calculator.possible_games.sum}"

puts '### Part II ###' + ('#'* 105)

power = 0
games_to_check.each do |game|
  power = power + calculator.min_cube_set(game).power
end

puts "Minimum cubesets found: #{games_to_check.length}"
puts "The total power of the minimum cubesets from the input file is #{power}"
