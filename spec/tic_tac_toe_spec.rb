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
  describe '#vertical_check' do
    it 'checks a vertical win' do
      @@arry_one = [1, 'x', 3]
      @@arry_one = [1, 'x', 3]
      @@arry_two = [4, 'x', 6]
      @@arry_three = [7, 'x', 9]
      expect(board.vertical_check).to be true
    end
    it 'checks when there is no vertical win' do
      @@arry_one = [1, 'x', 3]
      @@arry_two = [4, 'x', 6]
      @@arry_three = [7, '0', 9]
      expect(board.vertical_check).not_to be true
    end
  end
  describe '#diagonal_check' do
    it 'checks diagonal wins' do
      @@arry_one = ['x', 2, 3]
      @@arry_two = [4, 'x', 6]
      @@arry_three = [7, 8, 'x']
      expect(board.diagonal_check).to be true
    end
    it 'checks when there is no diagonal wins' do
      @@arry_one = ['x', 2, 3]
      @@arry_two = [4, 'x', 6]
      @@arry_three = [7, 'x', 9]
      expect(board.diagonal_check).not_to be true
    end
  end
end