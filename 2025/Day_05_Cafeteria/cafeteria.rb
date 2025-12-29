require_relative 'lib/ingredient_validator'

puts "####### PART ONE ###############################"
puts "#### Importing and validating sample data ####"

sample_ingredient_validator = IngredientValidator.new
File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true).each do |line|
  if line.empty?
    puts "\n"
    next
  end

  if line.include?('-')
    puts "Importing range '#{line}'"
    sample_ingredient_validator.add_id_range(line)
  else
    sample_ingredient_validator.fresh?(line) ? puts("#{line} is fresh") : puts("#{line} is not fresh")
  end
end

puts "\n"
puts "#{sample_ingredient_validator.fresh_ingredients_amount} of the available ingredient IDs are fresh"

puzzle_ingredient_validator = IngredientValidator.new

puts "\n\n"
puts "####### PART ONE ###############################"
puts "#### Importing and validating puzzle data ####"

File.readlines("#{File.dirname(__FILE__)}/input.txt", chomp: true).each do |line|
  if line.empty?
    puts "\n"
    next
  end

  if line.include?('-')
    puts "Importing range '#{line}'"
    puzzle_ingredient_validator.add_id_range(line)
  else
    puzzle_ingredient_validator.fresh?(line) ? puts("#{line} is fresh") : puts("#{line} is not fresh")
  end
end

puts "\n"
puts "#{puzzle_ingredient_validator.fresh_ingredients_amount} of the available ingredient IDs are fresh"

puts "\n\n"
puts "####### PART TWO ###############################"
puts "#### Importing and validating sample data ####"

puts "\n"
puts "#{sample_ingredient_validator.fresh_ingredient_ids.length} ingredient IDs are considered to be fresh"
