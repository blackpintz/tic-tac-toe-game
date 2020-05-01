require 'rubygems'
require 'terminal-table/import'

class Player
  attr_accessor :token
  def initialize(token)
    @token = token
  end
end

class Board
  attr_accessor :arr
  @@board_number = nil
  def initialize(arr)
    @arr = arr
  end

  def change_board(res, token)
    val = res.to_i
    if @arr.include?(val)
      if token.zero?
        @arr.map! do |value|
          value == val ? value = 'X' : value
        end
      else
        @arr.map! do |value|
          value == val ? value = 0 : value
        end
      end
      @@board_number = @arr.each_slice(3).to_a
      @@arry_one = @@board_number[0]
      @@arry_two = @@board_number[1]
      @@arry_three = @@board_number[2]
    end

    def draw_board
      board = table do |t|
        t << @@arry_one
        t.add_separator
        t << @@arry_two
        t.add_separator
        t << @@arry_three
      end
      board
    end

    def vertical_check
      check = nil
      i = 0
      while i < @@arry_one.length
        check = @@arry_one[i] == @@arry_two[i] && @@arry_one[i] == @@arry_three[i]
        i += 1
        break if check == true
      end
      check == true
    end

    def diagonal_check
      i = 0
      while i < @@arry_one.length
        check = (@@arry_one[i] == @@arry_two[i + 1] && @@arry_one[i] == @@arry_three[i + 2]) || (@@arry_three[i] == @@arry_two[i + 1] && @@arry_three[i] == @@arry_one[i + 2])
        i += 1
        break if check == true
      end
      check == true
    end

    def linear_check
      check = (@@arry_one.all?(0) || @@arry_one.all?('X')) || (@@arry_two.all?(0) || @@arry_two.all?('X')) || (@@arry_three.all?(0) || @@arry_three.all?('X'))
      check == true
    end

    def winner
      if linear_check || diagonal_check || vertical_check
        true
      else
        false
      end
    end
  end
end

class GameLogic
  def repeat(game_arr, token, playing_board, player_one, player_two, _game_func, ans)
    if ans == 'y' || ans == 'yes'
      arr = []
      token = 0
      game_arr = (1..9).to_a
      playing_board = Board.new(game_arr)
      method(game_func(arr, game_arr, token, playing_board, player_one, player_two)).call
    elsif ans == 'n' || ans == 'no'
      exit
    end

    repeat_game.repeat(game_arr, token, playing_board, player_one, player_two, :game_func)
  end
end
