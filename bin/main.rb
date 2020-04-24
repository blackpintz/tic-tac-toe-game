#!/usr/bin/env ruby

puts 'Player one'

player_one = gets.chomp

puts 'Player two'

player_two = gets.chomp

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
