#!/usr/bin/env ruby

require_relative '../lib/game.rb'

puts 'Name of Player one'
player_one = gets.chomp

puts 'Name of Player two'
player_two = gets.chomp

<<<<<<< HEAD
puts "Player one is #{player_one} and player two is #{player_two}"

game_on = true
winner = false

while game_on && winner

  puts ' | | '
  puts ' | | '
  puts ' | | '

  puts "#{player_one} what is your number?"

  score = gets.chomp.to_i

  # Declare an array to keep record of the scores
  scores_value = []

  # Push to the score to the array
  scores_value.push(score)

  puts "#{player_one} your score is #{score}"

  puts ' | |0'
  puts ' | | '
  puts ' | | '

  puts "#{player_two} what is your number?"

  score = gets.chomp.to_i

  # Check if player two score is in the array
  if scores_value.include?(score)
    puts 'Invalid score! Please select another score'

    # Request player two to enter another score
    puts "#{player_two} what is your number?"

    score = gets.chomp.to_i

    scores_value.push(score)

  else
    scores_value << score
  end

  puts "#{player_two} your score is #{score}"

  puts ' | |0'
  puts ' |X| '
  puts ' | | '

  puts "#{player_one} what is your number?"

  score = gets.chomp.to_i

  puts "#{player_one} your score is #{score}"

  puts ' | |0'
  puts ' |X|0'
  puts ' | | '

  puts "#{player_two} what is your number?"

  score = gets.chomp.to_i

  puts "#{player_two} your score is #{score}"

  puts ' | |0'
  puts ' |X|0'
  puts ' |X| '

  puts "#{player_one} what is your number?"

  score = gets.chomp.to_i

  puts "#{player_one} your score is #{score}"

  # if X's aligned or 0's aligned horizontally or vertically or diagonally,
  # winner is true and game_on false

  puts ' | |0'
  puts ' |X|0'
  puts ' |X|0'

  winner = true
  game_on = false
  puts "#{player_one} you win! #{score} got you there!"

  # scenario where that game is a draw
  # if all the moves have been played and either the zeros or Xs are not aligned,
  # then the game is a draw and winner and game_on are false

  puts 'X|0|0'
  puts '0|X|X'
  puts '0|X|0'

  puts 'Game over! No winner. Do you want to play again?'
  winner = false
  game_on = false
end
puts 'Do you want to play again?'

play_again = gets.chomp

puts play_again.to_s
=======
puts "player one is #{player_one} and player two is #{player_two}"

game_arr = (1..9).to_a
player = Player.new(0)
token = player.token
playing_board = Board.new(game_arr)
board_arr = []

def game_func(arr, game_arr, token, playing_board, player_one, player_two)
  i = arr.length + 1
  while i.positive?
    if token.zero?
      puts "#{player_one}, what is your number?"
      answer = gets.chomp
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr, game_arr, token, playing_board, player_one, player_two)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr, game_arr, token, playing_board, player_one, player_two)
      else
        arr << answer.to_i
        playing_board.change_board(answer, token)
        puts playing_board.draw_board
        token = 1
      end
    else
      puts "#{player_two}, what is your number?"
      answer = gets.chomp.to_i
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr, game_arr, token, playing_board, player_one, player_two)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr, game_arr, token, playing_board, player_one, player_two)
      else
        arr << answer.to_i
        playing_board.change_board(answer, token)
        puts playing_board.draw_board
        token = 0
      end
    end
    i += 1
    break if i == 10 || playing_board.winner
  end
  puts arr.length
  if arr.length == 9 || playing_board.winner

    repeat_game = GameLogic.new

    if playing_board.winner
      puts "#{player_one}, you've won the game" if token == 1
      puts "#{player_two}, you've won the game" if token.zero?
      puts 'Do you wanna play again? Press y if yes and n if no'
      ans = gets.chomp
      while ans != 'y' && ans != 'n'
        puts "Enter 'y' or 'n' "
        ans = gets.chomp
        break if ans == 'y' || ans == 'n'
      end
      puts 'Bye for now.' if ans == 'n' || ans == 'no'
      repeat_game.repeat(game_arr, token, playing_board, player_one, player_two, :game_func, ans)
    else
      puts 'Looks like its a draw game'
      puts 'Do you wanna play again? Press y if yes and n if no'
      ans = gets.chomp
      while ans != 'y' && ans != 'n'
        puts "Enter 'y' or 'n' "
        ans = gets.chomp
        break if ans == 'y' || ans == 'n'
      end
      puts 'Bye for now.' if ans == 'n' || ans == 'no'
      repeat_game.repeat(game_arr, token, playing_board, player_one, player_two, :game_func, ans)
    end

    repeat_game.repeat(game_arr, token, playing_board, player_one, player_two, :game_func, ans)
  end
end

game_func(board_arr, game_arr, token, playing_board, player_one, player_two)
>>>>>>> game_logic
