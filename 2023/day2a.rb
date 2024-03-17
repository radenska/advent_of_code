class CubeGame

  def initialize(params_hash)
    @games_array = read_file(params_hash[:filepath])
    @num_cubes = params_hash[:num_cubes]
  end

  def read_file(path)
    games_array = []
    File.foreach(path).with_index do |game, line_num|
      
      games_array << { id: line_num + 1, rounds: game.split(";")}
    end
    games_array
  end

  def calculate_sum
     valid_game_ids = []
     @games_array.each do |game|
       valid_round = true
       game[:rounds].each do |round|
         red = round.scan(/\b(\d+)\s+red\b/).flatten.map(&:to_i).sum
         green = round.scan(/\b(\d+)\s+green\b/).flatten.map(&:to_i).sum
         blue = round.scan(/\b(\d+)\s+blue\b/).flatten.map(&:to_i).sum
         valid_round = false unless check_cube_count(:red, red) && check_cube_count(:green, green) && check_cube_count(:blue, blue)
       end
       valid_game_ids << game[:id] if valid_round

     end
     p valid_game_ids
     valid_game_ids.sum
  end

  def check_cube_count(key, num)
    num <= @num_cubes[key]
  end
end

puts "The answer to day 2a is: #{CubeGame.new({ filepath: 'day2.txt', num_cubes: { red: 12, green: 13, blue: 14 }}).calculate_sum}"

require "minitest/autorun"

class CubeGameTest < Minitest::Test
  def setup
    @example_params = { filepath: 'example2a.txt', num_cubes: { red: 12, green: 13, blue: 14 } }
  end

  def test_case1
    assert_equal 8, CubeGame.new(@example_params).calculate_sum
  end
end
