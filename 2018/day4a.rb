class SomeThing

  def self.intake
    input_array = []
    File.open("day4.txt").each do |line|
      input_array << line
    end
    input_array
  end

  def self.do_thing(input)
    sorted_events = input.sort { |a, b| a <=> b }
    minutes = []

    sorted_events.each do |line|
      bits = line.split("] ")
      minute = bits[0].slice(15, 16).to_i
      action = bits[1]
      minutes << [ minute, action ]
    end

    chunked = minutes.slice_before { |i| i[1].include?('h') }.to_a
    sleep_by_guard = {}

    chunked.each do |hour|
      if hour.length > 1
        guard_number = hour[0][1].split("").map {|x| x[/\d+/]}.join("")
        (2...hour.length).step(2) do |index|
          fell_asleep = hour[index - 1][0].to_i
          woke_up = hour[index][0].to_i

          (fell_asleep...woke_up).each do |minute|
            stringified_minute = minute.to_s
            if sleep_by_guard[guard_number]
              sleep_by_guard[guard_number] << minute
            else
              sleep_by_guard[guard_number] = []
              sleep_by_guard[guard_number] << minute
            end
          end
        end
      end
    end
    sleep_by_guard
    h = sleep_by_guard.sort_by { |k, v| v.length }.reverse
    key, val = h.first
    sleepiest_minute = val.max_by { |i| val.count(i) }
    sleepiest_guard = key.to_i
    sleepiest_minute * sleepiest_guard
  end
end

require "minitest/autorun"

class SomeThingTest < Minitest::Test
  def test_case1
    input = ["[1518-11-01 00:00] Guard #10 begins shift", "[1518-11-01 00:05] falls asleep", "[1518-11-01 00:25] wakes up", "[1518-11-01 00:30] falls asleep", "[1518-11-01 00:55] wakes up", "[1518-11-01 23:58] Guard #99 begins shift", "[1518-11-02 00:40] falls asleep", "[1518-11-02 00:50] wakes up", "[1518-11-03 00:05] Guard #10 begins shift", "[1518-11-03 00:24] falls asleep", "[1518-11-03 00:29] wakes up", "[1518-11-04 00:02] Guard #99 begins shift", "[1518-11-04 00:36] falls asleep", "[1518-11-04 00:46] wakes up", "[1518-11-05 00:03] Guard #99 begins shift", "[1518-11-05 00:45] falls asleep", "[1518-11-05 00:55] wakes up"]
    assert_equal 240, SomeThing.do_thing(input)
  end
end

input = SomeThing.intake()
#
puts SomeThing.do_thing(input)
