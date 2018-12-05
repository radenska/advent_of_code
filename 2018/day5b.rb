class SomeThing

  def self.intake
    input_array = []
    File.open("day5.txt").each do |line|
      input_array << line
    end
    input_array
  end

  def self.remove_letters(input)
    counts = {}
    polymer = input[0]
    alphabet = ("a".."z").to_a
    alphabet.each do |letter|
      if polymer.include?(letter)
        temp_polymer = polymer.dup
        temp_polymer.gsub!(letter, "")
        temp_polymer.gsub!(letter.upcase, "")
        result = do_thing([temp_polymer])
        counts[letter] = result
      end
    end
    puts "COUNTS #{counts}"
    sorted = counts.sort_by { |k, v| v }
    puts "WINNER LETTER #{sorted[0][0]}, COUNT #{sorted[0][1]}"
    sorted[0][1]
  end

  def self.do_thing(input)
    polymer = input[0].gsub("\n", "").split("")
    loop do
      change_in_length = 0
      polymer.each_with_index do |letter, index|
        old_length = polymer.length
        break if index == polymer.length - 1
        if letter.downcase == polymer[index + 1].downcase && letter != polymer[index + 1]
          polymer.delete_at(index)
          polymer.delete_at(index)
        end
        change_in_length = old_length - polymer.length
        break if change_in_length != 0
      end
      break if change_in_length == 0
    end
    p polymer.length
  end

end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  # def test_case1
  #   input = ["dabAcCaCBAcCcaDA"]
  #   assert_equal 4, SomeThing.remove_letters(input)
  # end
end

input = SomeThing.intake()
#
puts SomeThing.remove_letters(input)
