class Trees
  def call(input)
    input
  end
end

require "minitest/autorun"

class TreesTest < Minitest::Test
  def test_case1
    # assert_equal 18, Trees.new.call(input)
  end
end
input = <<-HERE
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
HERE

# input = File.read("day7.txt")
p Trees.new.call(input)
