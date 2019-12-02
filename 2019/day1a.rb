class ModuleFuel

  def self.intake
    input_array = []
    File.open("day1a.txt").each do |line|
      input_array << line.tr('\n', '').to_i
    end
    p input_array
  end

  def self.calc(mass)
    mass / 3 - 2
  end

  def self.total_fuel
    sum = 0
    input = intake
    input.each { |mass| sum += calc(mass) }
    sum
  end
end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_case1
    assert_equal 2, ModuleFuel.calc(12)
  end

  def test_case2
    assert_equal 2, ModuleFuel.calc(14)
  end

  def test_case3
    assert_equal 654, ModuleFuel.calc(1969)
  end

  def test_case4
    assert_equal 33583, ModuleFuel.calc(100756)
  end

  def test_case5
    assert_equal 34241, ModuleFuel.total_fuel
  end
end
