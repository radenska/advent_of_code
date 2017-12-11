def unique
  all_the_things = []
  File.open("day7.txt").each do |line|
    all_the_things << line.gsub!(/[0-9()->\n]/,"")
  end
  # xegshds
  all_the_things
  flat = all_the_things.flatten.map{ |x| x.split.join(",").split(",")}.flatten
  # .map{ |x| x.split(" ") }.flatten
  # .flatten
  counts = Hash.new 0
  flat.each do |word|
    counts[word] += 1
  end
  # p flat.count
  p counts.select{|key, hash| hash == 1 }
  # it = ""
  # flat.each_with_index do |name, index|
  #   flat.delete_at(index)
  #   if flat.index(name) != nil
  #     flat.delete_at(flat.index(name))
  #   else
  #     p it = name
  #   end
  #   p flat.count
  # end
  # p it
  # .flatten
  # .to_s.split(" ").uniq
end

unique
