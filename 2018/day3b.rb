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
    list_of_keys = []
    input.each do |line|
      d = dimensions(line)
      list_of_keys << [ d[:key], d[:size] ]
      cloth = eval(d, cloth)
    end
    found_it = nil
    list_of_keys.each do |arr|
      id = arr[0]
      size = arr[1]
      ones = cloth.select{|key, hash| hash[:id].include?(id) && hash[:count] == 1 }
      if (ones.length == size)
        found_it = id
      end
      break if found_it
    end
    found_it
  end

  def self.dimensions(input_line)
    bits = input_line.split(" ")
    key = bits[0].gsub("#", "")
    left_edge = bits[2].split(",").first.to_i
    top_edge = bits[2].split(",")[1].gsub(":", "").to_i
    width = bits[3].split("x").first.to_i
    height = bits[3].split("x")[1].to_i
    { key: key, left_edge: left_edge, top_edge: top_edge, width: width, height: height, size: width * height}
  end

  def self.eval(d, cloth)
    left_edge = d[:left_edge] + 1
    width = d[:width] + left_edge
    top_edge = d[:top_edge] + 1
    height = d[:height] + top_edge

    (left_edge...width).each do |x|
      (top_edge...height).each do |y|
        if cloth[[x, y]]
          cloth[[x, y]][:count] += 1
          cloth[[x, y]][:id] << d[:key]
        else
          cloth[[x, y]] = { count: 1, id: [d[:key]] }
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
    assert_equal "3", SomeThing.do_thing(input)
  end
end

input = SomeThing.intake()
#
puts "UNIQUE THING #{SomeThing.do_thing(input)}"
