class Hex
  def call(trail)

  end
end

trail = "ne,ne,ne"
# ne,ne,ne is 3 steps away.
# ne,ne,sw,sw is 0 steps away (back where you started).
# ne,ne,s,s is 2 steps away (se,se).
# se,sw,se,sw,sw is 3 steps away (s,s,sw).

p Hex.new.call(trail)
