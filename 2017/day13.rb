class Scan
  def call(input, delay)
    layers = input.split("\n")
    new_layers = []
    layers.each do |layer|
       new_layers << layer.split(": ")
    end
    new_layers.each do |layer|
      layer[0] = layer[0].to_i
      layer[1] = layer[1].to_i
    end
    last_layer = new_layers.last[0]
    @layer_hash = new_layers.to_h
    (0..last_layer).each do |layer|
      if @layer_hash.key?(layer)
        @layer_hash[layer] = [@layer_hash[layer] - 1, 0, "+"]
      end
      if !@layer_hash.key?(layer)
        @layer_hash[layer] = 0
      end
    end
    current = 0
    severity = 0
    length = @layer_hash.count
    (0..delay).each do
      scanner
    end
    (0...length).each do |index|
      if 0 == @layer_hash[current][1] && @layer_hash[current].class == Array
        severity += index * (@layer_hash[index][0] + 1)
      end
      scanner
      current +=1
    end
    severity
  end

  def scanner
    @layer_hash.each do |layer|
      if layer.class == Array
        case layer[1][2]
        when "+"
          if layer[1][1] == layer[1][0]
            layer[1][1] = layer[1][1] - 1
            layer[1][2] = "-"
          else
            layer[1][1] += 1
          end
        when "-"
          if layer[1][1] == 0
            layer[1][1] = layer[1][1] + 1
            layer[1][2] = "+"
          else
            layer[1][1] = layer[1][1] - 1
          end
        end
      end
    end
  end
end

input = <<HERE
0: 3
1: 2
2: 4
4: 4
6: 5
8: 6
10: 6
12: 8
14: 6
16: 6
18: 8
20: 12
22: 8
24: 8
26: 9
28: 8
30: 8
32: 12
34: 20
36: 10
38: 12
40: 12
42: 10
44: 12
46: 12
48: 12
50: 12
52: 12
54: 14
56: 14
58: 12
62: 14
64: 14
66: 14
68: 14
70: 14
72: 14
74: 14
76: 14
78: 14
80: 18
82: 17
84: 14
HERE
delay = 0
sev = 1
while sev != 0
  sev = Scan.new.call(input, delay)
  p delay
  delay += 1
end
