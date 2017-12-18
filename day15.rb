class Generator
  def calculate(initial_value, multiplier)
    values = []
    bits = []
    first_value = initial_value * multiplier % 2147483647
    values << first_value
    first_bits = first_value.to_s(2)
    bits << first_bits.slice(first_bits.length - 16, first_bits.length)
    (0...40000000).each do
      new_value = values.last * multiplier % 2147483647
      new_bin = new_value.to_s(2)
      values << new_value
      if new_bin.length < 16
        zeroes_to_add = ""
        (0...(new_bin.length - 16).abs).each do
          zeroes_to_add += "0"
        end
        new_bin = zeroes_to_add + new_bin
      end
      bits << new_bin.slice(new_bin.length - 16, new_bin.length)
    end
    bits
  end
  def compare(val1, val2)
    same = 0
    val1.each_with_index do |val, index|
      same += 1 if val == val2[index]
    end
    same
  end
end

val1 = Generator.new.calculate(277, 16807)
val2 = Generator.new.calculate(349, 48271)
p Generator.new.compare(val1, val2)
