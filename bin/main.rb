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

def game_func(arr, game_arr,token)
  i = arr.length + 1
  while i.positive?
    if token == 0
      puts "#{$player_one}, what is your number?"
      answer = gets.chomp
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr, game_arr,token)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr, game_arr,token)
      else
        arr << answer.to_i
        token = 1 
        a_board = Board.new([1,2,3],[4,5,6])
      end
    else
      puts "#{$player_two}, what is your number?"
      answer = gets.chomp.to_i
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr, game_arr,token)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr, game_arr,token)
      else
        arr << answer.to_i
        token = 0
      end
    end
    logic = GameLogic.new(game_arr)
    puts token
    puts logic.game(answer, token)
    i += 1
    break if i == 10 || $winner == true
  end
  puts arr.length
  if arr.length == 9 || $winner == true
    def repeat(num_arr, game_arr, token)
      puts 'Do you wanna play again,. Press y if yes and n if no'
      ans = gets.chomp
      if ans == 'y' || ans == 'yes'
        arr = []
        token = 0
        game_arr = (1..9).to_a
        $board_number = []
        $winner = false
        game_func(arr, game_arr,token)
      elsif ans == 'n' || ans == 'no'
        puts 'Alright Guys. Get out of here'
        exit
      else
        puts 'Please Enter y or n'
        repeat($num_arr, game_arr, token)
      end
    end
    if $winner
      puts "#{$player_one}, you've won the game" if token == 1
      puts "#{$player_two}, you've won the game" if token == 0
      repeat($num_arr, game_arr, token)
    else
      puts 'Looks like its a draw game'
      repeat($num_arr, game_arr, token)
    end
    repeat($num_arr, game_arr, token)
  end
end

puts game_func($num_arr, game_arr, token)
