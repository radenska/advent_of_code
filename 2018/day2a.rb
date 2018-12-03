class SomeThing

  def self.intake
    input_array = []
    File.open("day2.txt").each do |line|
      input_array << line
    end
    input_array
  end

  def self.add_up(input)
    twos = 0
    threes = 0
    input.each do |line|
      count = {}
      letters = line.split('')
      letters.each do |letter|
        if count.key?(letter)
          count[letter] += 1
        else
          count[letter] = 1
        end
      end
      if count.select{|key, value| value == 2 }.length > 0
        twos += 1
      end
      if count.select{|key, value| value == 3}.length > 0
        threes += 1
      end
      twos * threes
    end
    puts "TWOS #{twos}"
    puts "THREES #{threes}"
    puts twos * threes
  end

end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_case1
    input = ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"]
    assert_equal 12, SomeThing.add_up(input)
  end
end

input = SomeThing.intake()
#
puts "TOTAL #{SomeThing.add_up(input)}"
