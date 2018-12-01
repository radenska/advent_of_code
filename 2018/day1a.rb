class SomeThing

  def self.intake
    input_array = []
    File.open("day1a.txt").each do |line|
      number = line.to_i
      input_array << number
    end
    input_array
  end

  def self.add_up(input)
    total = 0
    input.each do |number|
      total += number
    end
    total
  end

end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_case1
    assert_equal SomeThing.add_up([1, 1, 1]), 3
  end

  def test_case2
    assert_equal SomeThing.add_up([1, 1, -2]), 0
  end

  def test_case3
    assert_equal SomeThing.add_up([-1, -2, -3]), -6
  end
end

input = SomeThing.intake()

puts "TOTAL #{SomeThing.add_up(input)}"
