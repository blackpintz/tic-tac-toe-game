require 'rubygems'
require 'terminal-table/import'

$num_arr = []
$playing_numbers = (1..9).to_a
$player_status = 1
$winner = false

class PlayerOne
  attr_reader :num_played
  def initialize(num_played)
    @num_played = num_played
    $player_status = 0
  end

  def push_arr
    $num_arr.push(@num_played)
  end
end

class PlayerTwo < PlayerOne
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

class CheckWinner < Board
  def vertical_check
    check = nil
    i = 0
    while i < @arry_one.length
      check = @arry_one[i] == @arry_two[i] && @arry_one[i] == @arry_three[i]
      i += 1
      break if check == true
    end
    check == true ? $winner = true : nil
  end

  def diagonal_check
    i = 0
    while i < @arry_one.length
      check = (@arry_one[i] == @arry_two[i + 1] && @arry_one[i] == @arry_three[i + 2]) || (@arry_three[i] == @arry_two[i + 1] && @arry_three[i] == @arry_one[i + 2])
      i += 1
      break if check == true
    end
    check == true ? $winner = true : nil
  end

  def linear_check
    check = (@arry_one.all?(0) || @arry_one.all?('X')) || (@arry_two.all?(0) || @arry_two.all?('X')) || (@arry_three.all?(0) || @arry_three.all?('X'))
    check == true ? $winner = true : nil
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
      check_win = CheckWinner.new($board_number[0], $board_number[1], $board_number[2])
      check_win.vertical_check
      check_win.diagonal_check
      check_win.linear_check
      my_board.draw_board
    end
  end
end
