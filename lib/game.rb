require 'rubygems'
require 'terminal-table/import'
$num_arr = []
$playing_numbers = (1..9).to_a
$player_status = 1

$answer = nil

class Player_one
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def notification
    "#{@name}, what is your number?"
  end
end

class Player_two < Player_one
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

class Notification
  def messenger(msg)
    method(msg).call
  end
end

class GameLogic
  def value_arr(value)
    $answer = method(value).call
    print $num_arr
  end

  def game(val,sample)
    if $playing_numbers.include?(val) && !$num_arr.include?(val)
        $playing_numbers.map! do |value|
          value == val ? value = 'X' : value
        end
      board_number = $playing_numbers.each_slice(3).to_a
      my_board = Board.new(board_number[0], board_number[1], board_number[2])
      
      $num_arr.push($answer)
      puts my_board.draw_board
      print $num_arr
    else
      puts 'Wrong value'
    end
  end
end
