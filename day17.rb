class Spinlock
  def call(steps)
    buffer = [0]
    current = 0
    (1..50000000).each do |index|
      (0...steps).each do
        if current == buffer.length - 1
          current = 0
        else
          current += 1
        end
        current
      end
      buffer.insert(current + 1, index)
      current += 1
    end
    # buffer[buffer.index(2017) + 1]
    buffer[buffer.index(0) + 1]
  end
end

p Spinlock.new.call(380)
