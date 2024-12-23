require_relative 'array'
class Processor

  attr_reader :data, :word_count

  def initialize
    @data = []
    @word_count = 0
  end

  def read(input)
    @data << input.chars
  end

  def clean_up
    @data = []
  end

  def clean_up_data(word)
    @data.each do |line|
      line.each_with_index do |char, index|
        line[index] = '.' if !word.chars.include? char
      end
    end
  end

  def count(element)
    element_count = 0
    data.each do |line|
      element_count += line.count(element)
    end
    element_count
  end

  def find(word)
    clean_up_data(word)
    puts "Word to find: #{word}"
    # Das Wort beginnt mit:
    start_character = word[0]
    puts "First character is #{start_character}"

    # An diesen Stellen findet man den Anfangsbuchstaben:
    positions = positions(start_character)

    # Nach dieser Menge an Überprüfungen hat man das Wort gefunden:
    checks = word.chars.length - 1
    puts "I need to check #{checks} remaining characters: #{word.chars[1..word.length]}"

    # Da man den ersten Buchstaben ja schon hat, beginnt die Überprüfung mit dem zweiten Buchstaben:
    check_index = 1

    # Erst einmal geht man davon aus, dass man ein valides Wort am Wickel hat
    valid = true

    # Jetzt beginnt das Überprüfen jeder gefundenen Position
    positions.each do |position|
      test_position = position
      puts "Checking #{start_character} in line #{test_position.y} at position #{test_position.x}"

      # Ich prüfe, so lang wie das Wort ist. Bei XMAS prüfe ich drei weitere Male: M, A und S
      checks.times do
        # Der nächste Buchstabe, den man finden möchte, ist:
        test_character = word[check_index]

        # Der soll sich rechts neben dem gefundenen Erstbuchstaben befinden
        test_position.x = test_position.x + 1

        # Ist die gefundene Sequenz von Zeichen nach wie vor valide?
        valid &&= valid?(test_character, test_position)

        puts "Let's look for #{test_character} at position #{test_position.x}. Is #{@data[test_position.y][test_position.x]} == #{test_character}? #{valid}"
        break if !valid


        # Dann nimm' den nächsten Buchstaben
        check_index += 1
      end

      # Wenn das Gesamtergebnis valide war, dann erhöhe die Anzahl gefundener Worte um 1
      puts "Did I find a valid word at #{position}? #{valid}"
      @word_count += 1 if valid
      valid = true
    end
  end

  def valid?(character, position)
    @data[position.y][position.x].eql? character
  end

  def positions(element)
    positions = []
    @data.each_with_index do |line, line_number|
      indices = line.indices(element)
      indices.each do |index|
        positions << Position.new(index, line_number)
      end
    end
    positions
  end
end
