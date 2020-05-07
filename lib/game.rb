require_relative 'board.rb'

class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end
end

class GameLogic
  def repeat(game_arr, _token, _playing_board, _player_one, _player_two, ans)
    if ans == 'y' || ans == 'yes'
      arr = []
      token = 0
      game_arr = (1..9).to_a
      playing_board = Board.new(game_arr)
      true
    elsif ans == 'n' || ans == 'no'
      false
    end
  end
end
