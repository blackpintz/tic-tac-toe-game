require_relative '../lib/game.rb'

describe 'Game' do
  let(:game) { GameLogic.new }
  let(:board) { Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }

  describe '#change_board' do
    it 'checks when a number(game number) and a token is provided' do
      expect(board.change_board(3, 0)).to eql([7, 8, 9])
    end
    it 'checks when a non number and a token is provided' do
      expect(board.change_board('p', 0)).not_to eql([7, 8, 9])
    end
  end
end