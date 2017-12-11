class Register
  def call(input)
    registers = Hash.new
    max = 0

    rows = input.split("\n").each do |row|
      instruction = row.split
      key1 = instruction.first
      key2 = instruction[4]
      registers[key1] = 0
    end
    rows.each do |row|
      instruction = row.split
      comp = instruction[4]
      comp_value = instruction[6].to_i
      value_to_change = instruction[0]
      increment_value = instruction[2].to_i
      if instruction[1] == "inc"
        operator = :+
      else
        operator = :-
      end
      comparison_operator = find_operator(instruction[5])
      if registers[comp].public_send(comparison_operator, comp_value)
        registers[value_to_change] = registers[value_to_change].public_send(operator, increment_value)
      end
      max = registers.values.max if max < registers.values.max
    end
    max
    # registers.values.max
  end

  def find_operator(op)
    case op
    when ">"
      :>
    when "<"
      :<
    when "=="
      :==
    when ">="
      :>=
    when "<="
      :<=
    when "!="
      :!=
    end
  end

end

require "minitest/autorun"

class RegisterTest < Minitest::Test
  def test_case1
    input = <<-HERE
b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10
    HERE
    assert_equal 1, Register.new.call(input)
  end
end

input = File.read("day8.txt")
p Register.new.call(input)
