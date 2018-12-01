class Bitstream
  def decipher
    array = []
    (0..127).each do |num|
      array << "flqrgnkx" + "-#{num.to_s}"
    end
    array
  end
end

p Bitstream.new.decipher
