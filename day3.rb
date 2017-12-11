def distance(loc)
  p square_root = Math.sqrt(loc)
  # diagonal down right from center are all the odd perfect squares
  # square root of input number rounded up equals the next perfect square
  # if it is odd, the square root is the number of rows/columns in the spiral square
  # if the input is the odd perfect square, the Manhattan distance is simply
  # its square root minus 1. Otherwise, the distance will be less. This works for
  # even perfect squares as well
  # if it's not a perfect square (pro tip: it won't be), figure out how far from
  # center the number is, then add that to the vertical distance to center
end

distance(325489)
#
# 37  36  35  34  33  32  31
# 38  17  16  15  14  13  30
# 39  18   5   4   3  12  29
# 40  19   6   1   2  11  28
# 41  20   7   8   9  10  27
# 42  21  22  23  24  25  26
# 43  44  45  46  47  48  49
                            # 326041
