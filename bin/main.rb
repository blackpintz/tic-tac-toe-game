#!/usr/bin/env ruby

require_relative '../lib/game.rb'

puts 'Name of Player one'
$player_one = gets.chomp

puts 'Name of Player two'
$player_two = gets.chomp

puts "player one is #{$player_one} and player two is #{$player_two}"

game_arr = (1..9).to_a
player = Player.new(0)
token = player.token
playing_board = Board.new(game_arr)
board_arr = []

def game_func(arr, game_arr,token, playing_board)
  i = arr.length + 1
  while i.positive?
    if token == 0
      puts "#{$player_one}, what is your number?"
      answer = gets.chomp
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr, game_arr,token, playing_board)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr, game_arr,token, playing_board)
      else
        arr << answer.to_i
        playing_board.change_board(answer, token)
        puts playing_board.draw_board
        puts playing_board.winner
        token = 1 
      end
    else
      puts "#{$player_two}, what is your number?"
      answer = gets.chomp.to_i
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr, game_arr,token, playing_board)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr, game_arr,token, playing_board)
      else
        arr << answer.to_i
        playing_board.change_board(answer, token)
        puts playing_board.draw_board
        puts playing_board.winner
        token = 0
      end
    end
    i += 1
    break if i == 10 || playing_board.winner
  end
  puts arr.length
  if arr.length == 9 || playing_board.winner
    def repeat(game_arr, token, playing_board)
      puts 'Do you wanna play again,. Press y if yes and n if no'
      ans = gets.chomp
      if ans == 'y' || ans == 'yes'
        arr = []
        token = 0
        game_arr = (1..9).to_a
        playing_board= Board.new(game_arr)
        $board_number = []
        game_func(arr, game_arr,token, playing_board)
      elsif ans == 'n' || ans == 'no'
        puts 'Alright Guys. Get out of here'
        exit
      else
        puts 'Please Enter y or n'
        repeat(game_arr, token,playing_board)
      end
    end
    if playing_board.winner
      puts "#{$player_one}, you've won the game" if token == 1
      puts "#{$player_two}, you've won the game" if token == 0
      repeat(game_arr, token,playing_board)
    else
      puts 'Looks like its a draw game'
      repeat(game_arr, token, playing_board)
    end
    repeat(game_arr, token, playing_board)
  end
end

puts game_func(board_arr, game_arr, token, playing_board)
