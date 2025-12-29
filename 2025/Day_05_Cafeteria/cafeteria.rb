require_relative 'lib/ingredient_validator'

puts "####### PART ONE ###############################"
puts "#### Importing and validating sample data ####"

ingredient_validator = IngredientValidator.new
File.readlines("#{File.dirname(__FILE__)}/sample_input.txt", chomp: true).each do |line|
  if line.empty?
    puts "\n"
    next
  end

  if line.include?('-')
    puts "Importing range '#{line}'"
    ingredient_validator.add_id_range(line)
  else
    ingredient_validator.fresh?(line) ? puts("#{line} is fresh") : puts("#{line} is not fresh")
  end
end

puts "\n"
puts "#{ingredient_validator.fresh_ingredients_amount} of the available ingredient IDs are fresh"

ingredient_validator.clear

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
    ingredient_validator.add_id_range(line)
  else
    ingredient_validator.fresh?(line) ? puts("#{line} is fresh") : puts("#{line} is not fresh")
  end
end

puts "\n"
puts "#{ingredient_validator.fresh_ingredients_amount} of the available ingredient IDs are fresh"
