class SomeThing

  def self.intake
    input_array = []
    File.open("day2.txt").each do |line|
      input_array << line
    end
    input_array
  end

  def self.add_up(input)
    found_it = nil
    input.each do |line|
      (0...line.length).each do |n|
        deleted_char = line[n]
        regex_string = line
        regex_string[n] = "."
        regex = Regexp.new regex_string
        regex
        input.each do |exp|
          if exp != line
            compare = regex.match(exp).to_s
            if compare.length > 0
              found_it = regex_string.gsub(/\W/, '')
              break
            end
          end
          break if found_it
        end
        break if found_it
        line[n] = deleted_char
      end
      break if found_it
    end
    found_it
  end

end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_case1
    input = ["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"]
    assert_equal "fgij", SomeThing.add_up(input)
  end
end

input = SomeThing.intake()
#
puts "TOTAL #{SomeThing.add_up(input)}"
