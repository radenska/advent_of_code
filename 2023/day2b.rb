class CubeGame

  def initialize(path)
    @games_array = read_file(path)
  end

  def read_file(path)
    games_array = []
    File.foreach(path).with_index do |game, line_num|
      
      games_array << { id: line_num + 1, rounds: game.split(";")}
    end
    games_array
  end

  def calculate_power
     game_maxes = []
     @games_array.each do |game|
       max_dice = { red: 0, green: 0, blue: 0 }
       game[:rounds].each do |round|
         red = round.scan(/\b(\d+)\s+red\b/).flatten.map(&:to_i).sum
         green = round.scan(/\b(\d+)\s+green\b/).flatten.map(&:to_i).sum
         blue = round.scan(/\b(\d+)\s+blue\b/).flatten.map(&:to_i).sum
         max_dice[:red] = red if red > max_dice[:red]
         max_dice[:green] = green if green> max_dice[:green]
         max_dice[:blue] = blue if blue > max_dice[:blue]
       end
       game_maxes << max_dice
     end

     powers_arr = game_maxes.map do |hash|
       hash.values.reduce(:*)
     end
     powers_arr.sum
  end
end

puts "The answer to day 2b is: #{CubeGame.new('day2.txt').calculate_power}"

require "minitest/autorun"

class CubeGameTest < Minitest::Test

  def test_case1
    assert_equal 2286, CubeGame.new('example2a.txt').calculate_power
  end
end
