class SomeThing

  def self.intake
    input_array = []
    File.open("day3.txt").each do |line|
      input_array << line
    end
    input_array
  end

  def self.do_thing(input)
    cloth = {}

    input.each do |line|
      d = dimensions(line)
      cloth = eval(d, cloth)
    end
    overlap_count = 0
    cloth.each do |space, num|
      overlap_count += 1 if num > 1
    end
    overlap_count
  end

  def self.dimensions(input_line)
    bits = input_line.split(" ")
    key = bits[0].gsub("#", "")
    left_edge = bits[2].split(",").first.to_i
    top_edge = bits[2].split(",")[1].gsub(":", "").to_i
    width = bits[3].split("x").first.to_i
    height = bits[3].split("x")[1].to_i
    { key: key, left_edge: left_edge, top_edge: top_edge, width: width, height: height}
  end

  def self.eval(d, cloth)
    left_edge = d[:left_edge] + 1
    width = d[:width] + left_edge
    top_edge = d[:top_edge] + 1
    height = d[:height] + top_edge

    (left_edge...width).each do |x|
      (top_edge...height).each do |y|
        if cloth[[x, y]]
          cloth[[x, y]] += 1
        else
          cloth[[x, y]] = 1
        end
      end
    end
    cloth
  end

end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_case1
    input = ["#1 @ 1,3: 4x4", "#2 @ 3,1: 4x4", "#3 @ 5,5: 2x2"]
    assert_equal 4, SomeThing.do_thing(input)
  end
end

input = SomeThing.intake()
#
puts "TOTAL #{SomeThing.do_thing(input)}"
