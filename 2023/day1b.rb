class SomeThing
  # read in file
  # iterate through file, looking for first and last digit in line
  # combine the digits in string form
  # return integer digit
  

  def self.read_input(filepath)
    File.read(filepath).split
  end

  def self.calculate_sum(filepath)
    input_array = read_input(filepath)
    num_sum = 0

    input_array.each do |line|
      # go until you reach first number, then reverse the line and go until you reach the first (last) number
      
      forward_regex = /1|one|2|two|3|three|4|four|5|five|6|six|7|seven|8|eight|9|nine/
      backward_regex = /enin|9|thgie|8|neves|7|xis|6|evif|5|ruof|4|eerht|3|owt|2|eno|1/

      first_number_string = line[forward_regex]
      last_number_string = line.reverse[backward_regex]
 
      first_number = get_number("first", first_number_string)
      last_number = get_number("last", last_number_string)

      num_sum += (first_number + last_number).to_i
    end
    
    num_sum
  end

  def self.get_number(position, value)
    word_to_digit_hash = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }
    
    return value if value.length == 1
    
    case position
    when "first"
      word_to_digit_hash[value]
    else
      word_to_digit_hash[value.reverse]
    end
  end
end

puts "THe answer is:"
puts SomeThing.calculate_sum('day1a.txt')

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_file_read
    input_arr = ['two1nine',
'eightwothree',
'abcone2threexyz',
'xtwone3four',
'4nineeightseven2','zoneight234',
'7pqrstsixteen']
    assert_equal input_arr, SomeThing.read_input('example1b.txt')
  end

  def test_end_digit
    assert_equal 281, SomeThing.calculate_sum('example1b.txt')
  end
end
