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
    totals = { "0" => 0 }
    loop do
      input.each do |number|
        total += number
        key = total.to_s
        if totals.key?(key)
          totals[key] += 1
          break
        else
          totals[key] = 1
        end
      end
      break if totals[total.to_s] > 1
    end
    total
  end

end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_case1
    assert_equal 10, SomeThing.add_up([3, 3, 4, -2, -4])
  end
  def test_case2
    assert_equal 5, SomeThing.add_up([-6, 3, 8, 5, -6])
  end
  def test_case3
    assert_equal 14, SomeThing.add_up([7, 7, -2, -7, -4])
  end
end

input = SomeThing.intake()

puts "TOTAL #{SomeThing.add_up(input)}"
