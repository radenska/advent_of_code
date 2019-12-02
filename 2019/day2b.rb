class Ops
  def initialize(array, replace_one, replace_two)
    @input_array = array
    @input_array[1] = replace_one
    @input_array[2] = replace_two
  end

  def sum(one_pos, two_pos, result_pos)
    result = @input_array[one_pos] + @input_array[two_pos]
    @input_array[result_pos] = result
  end

  def multiply(one_pos, two_pos, result_pos)
    result = @input_array[one_pos] * @input_array[two_pos]
    @input_array[result_pos] = result
  end

  def perform_op
    op_position = 0
    while op_position < @input_array.length
      puts "in WHILE, OP POSITION IS #{op_position}"
      case @input_array[op_position]
      when 1
        sum(@input_array[op_position + 1], @input_array[op_position + 2], @input_array[op_position + 3])
        op_position += 4
      when 2
        multiply(@input_array[op_position + 1], @input_array[op_position + 2], @input_array[op_position + 3])
        op_position += 4
      when 99
        op_position = @input_array.length
      else
        puts "error at op_position #{op_position}, opcode is #{@input_array[op_position]}"
        op_position = @input_array.length
      end
    end
    @input_array
  end

  def self.generate_pairs(first, second)
    pairs_array = []
    (0..first).each do |index_one|
      (0..second).each do |index_two|
        pairs_array << [index_one, index_two]
      end
    end
    pairs_array
  end
end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  # def test_case1
  #   ops = Ops.new([1,9,10,3,2,3,11,0,99,30,40,50])
  #   final_array = ops.perform_op
  #   assert_equal 70, final_array[3]
  #   assert_equal 3500, final_array[0]
  # end
  #
  # def test_case2
  #   ops = Ops.new([1,0,0,0,99]).perform_op
  #   assert_equal [2,0,0,0,99], ops
  # end
  #
  # def test_case3
  #   ops = Ops.new([2,3,0,3,99]).perform_op
  #   assert_equal [2,3,0,6,99], ops
  # end
  #
  # def test_case4
  #   ops = Ops.new([2,4,4,5,99,0]).perform_op
  #   assert_equal [2,4,4,5,99,9801], ops
  # end

  # def test_case5
  #   ops = Ops.new([1,1,1,4,99,5,6,0,99]).perform_op
  #   assert_equal [30,1,1,4,2,5,6,0,99], ops
  # end

  def test_case6
    pairs = Ops.generate_pairs(99, 99)
    pairs.each do |pair|
      arr = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,19,10,23,1,23,13,27,1,6,27,31,1,9,31,35,2,10,35,39,1,39,6,43,1,6,43,47,2,13,47,51,1,51,6,55,2,6,55,59,2,59,6,63,2,63,13,67,1,5,67,71,2,9,71,75,1,5,75,79,1,5,79,83,1,83,6,87,1,87,6,91,1,91,5,95,2,10,95,99,1,5,99,103,1,10,103,107,1,107,9,111,2,111,10,115,1,115,9,119,1,13,119,123,1,123,9,127,1,5,127,131,2,13,131,135,1,9,135,139,1,2,139,143,1,13,143,0,99,2,0,14,0]
      ops = Ops.new(arr, pair[0], pair[1]).perform_op
      puts "array length is #{ops.length}"
      if ops[0] == 19690720
        puts "THE CORRECT PAIR IS: #{pair}"
        break
      end
    end
    # (0..99).each do |index_one|
    #   (0..99).each do |index_two|
    #     ops = Ops.new(arr, index_one, index_two).perform_op
    #     puts "ops[1] #{ops[1]} ops[2] #{ops[2]} length #{ops.length}}"
    #     if ops[0] == 19690720
    #       puts "INDEX TWO IS #{index_two}"
    #       break
    #     end
    #   end
    #   if ops[0] == 19690720
    #     puts "INDEX one IS #{index_one}"
    #     break
    #   end
    # end
    # assert_equal 19690720, ops[0]
  end
end
