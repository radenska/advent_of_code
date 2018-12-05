class SomeThing

  def self.intake
    input_array = []
    File.open("day5.txt").each do |line|
      input_array << line
    end
    input_array
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
    polymer.length
  end

end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  # def test_case1
  #   input = ["dabAcCaCBAcCcaDA"]
  #   # , "dabAaCBAcCcaDA", "dabCBAcCcaDA", "dabCBAcaDA"]
  #   assert_equal 10, SomeThing.do_thing(input)
  # end
end

input = SomeThing.intake()
#
puts SomeThing.do_thing(input)
