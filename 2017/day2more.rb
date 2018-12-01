class Checksum
  def call(input)
    rows = input.split("\n").map{ |line| line.split.map(&:to_i)}
    checksum = 0
    rows.each do |row|
      checksum += row.max - row.min
    end
    checksum
  end
  # a row has things in it... typically columns
  # add all row differences

end

require "minitest/autorun"

class ChecksumTest < Minitest::Test
  def test_case1
    input = <<-HERE
5 1 9 5
7 5 3
2 4 6 8
    HERE
    assert_equal 18, Checksum.new.call(input)
  end
end

input = File.read("day2more.txt")
p Checksum.new.call(input)
