require 'rubygems'
require 'terminal-table/import'

$num_arr = []
$playing_numbers = (1..9).to_a
$winner = false

class Player
  attr_accessor :token
  def initialize(token)
    @token = token
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
  
  def vertical_check
    check = nil
    i = 0
    while i < @arry_one.length
      check = @arry_one[i] == @arry_two[i] && @arry_one[i] == @arry_three[i]
      i += 1
      break if check == true
    end
    check == true ? true : false
  end
  
  def diagonal_check
    i = 0
    while i < @arry_one.length
      check = (@arry_one[i] == @arry_two[i + 1] && @arry_one[i] == @arry_three[i + 2]) || (@arry_three[i] == @arry_two[i + 1] && @arry_three[i] == @arry_one[i + 2])
      i += 1
      break if check == true
    end
    check == true ?  true : false
  end
  
  def linear_check
    check = (@arry_one.all?(0) || @arry_one.all?('X')) || (@arry_two.all?(0) || @arry_two.all?('X')) || (@arry_three.all?(0) || @arry_three.all?('X'))
    check == true ? true : false
  end
  
  def winner
    if linear_check || diagonal_check || vertical_check
      true
    else
      false
    end
  end
  
end


class GameLogic
  def initialize(arr)
    @arr = arr
  end

  def game(res, token)
    val = res.to_i
    if @arr.include?(val)
      if token == 0
        @arr.map! do |value|
          value == val ? value = 'X' : value
        end
      else
        @arr.map! do |value|
          value == val ? value = 0 : value
        end
      end
      $board_number = @arr.each_slice(3).to_a
      my_board = Board.new($board_number[0], $board_number[1], $board_number[2])
      puts my_board.winner
      my_board.draw_board
    end
  end
end
