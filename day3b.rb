# 147  142  133  122   59
# 304    5    4    2   57
# 330   10    1    1   54
# 351   11   23   25   26
# 362  747  806  854  905

# 17   16   15   14   13
# 18    5    4    3   12
# 19    6    1    2   11
# 20    7    8    9   10
# 21   22   23   24   25
#

def fill
  matrix = [ { :loc_x =>  0, :loc_y => 0, :value => 1, :dir => "right"}, { :loc_x =>  1, :loc_y => 0, :value => 1, :dir => "up"} ]
  current = matrix.last
  while current[:value] < 800
    last_index = matrix.length - 1
    # 325489
    if current[:value] == "up"
      matrix << { :loc_x =>  matrix[last_index - 1], :loc_y => matrix[last_index - 1] + 1, :value => 1, :dir => "" }
    end

    val = current[:value]
  end
  p val
end
