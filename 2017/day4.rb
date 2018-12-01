def read_file
  pass = []
  File.open("day4.txt").each do |line|
    pass << line.delete("\n")
  end
  num_valid = 0
  pass.each do |phrase|
    words = phrase.split(" ")
    sorted_words = []
    words.each do |word|
      new_word = word.split("")
      sorted_words << new_word.sort!.join("")
    end
    valid = sorted_words.detect{ |e| sorted_words.count(e) > 1 }
    num_valid += 1 if valid == nil
  end
  p num_valid
end
read_file()
