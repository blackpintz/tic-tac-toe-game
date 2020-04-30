require 'rubygems'
require 'terminal-table/import'
$num_arr = []
$playing_numbers = (1..9).to_a
$player_status = 1

$answer = nil

class Player_one
  attr_reader :num_played
  def initialize(num_played)
    @num_played = num_played
    $player_status = 0
  end

  def push_arr
    $num_arr.push(@num_played)
  end
end

class Player_two < Player_one
  def initialize(num_played)
    super
    $player_status = 1
  end
end

class Board
  attr_accessor :arry_one, :arry_two, :arry_three
  def initialize(arry_one, arry_two, arry_three)
    @arry_one = arry_one
    @arry_two = arry_two
    @arry_three = arry_three
  end

  def draw_board
    board = table do |t|
      t << @arry_one
      t.add_separator
      t << @arry_two
      t.add_separator
      t << @arry_three
    end
    board
  end
end

class GameLogic
  def game(res)
    val = res.to_i
    if $playing_numbers.include?(val)
      if $player_status == 1
        $playing_numbers.map! do |value|
          value == val ? value = 'X' : value
        end
      else
        $playing_numbers.map! do |value|
          value == val ? value = 0 : value
        end
      end
      $board_number = $playing_numbers.each_slice(3).to_a
      my_board = Board.new($board_number[0], $board_number[1], $board_number[2])
      puts my_board.draw_board
    elsif val.is_a? String
      puts 'Entered a string'
    end
  end
end
