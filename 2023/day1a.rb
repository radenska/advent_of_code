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
      nums = line.scan(/\d+/).join('')
      nums_length = nums.length
      
      unless nums_length == 0
        num_sum = num_sum + (nums[0] + nums[nums_length - 1]).to_i 
      end
    end
    
    num_sum
  end
end

puts "THe answer is:"
puts SomeThing.calculate_sum('day1a.txt')

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_file_read
    input_arr = ['1abc2', 'pqr3stu8vwx', 'a1b2c3d4e5f', 'treb7uchet']
    assert_equal input_arr, SomeThing.read_input('example1a.txt')
  end

  def test_end_digit
    assert_equal 142, SomeThing.calculate_sum('example1a.txt')
  end
end
