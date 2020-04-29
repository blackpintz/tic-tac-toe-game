#!/usr/bin/env ruby

require_relative '../lib/game.rb'

# puts 'Player One Enter your name!!'

# player_one = gets.chomp

# puts 'Player Two Enter your name!!'

# player_two = gets.chomp

# puts "player One is #{player_one} and palyer two is #{player_two} "

# alican = TicTacToe.new(player_one, player_two)

# alican.input

# def out_of_range
#     puts "Your number is out of range"
#     puts "Please enter another number?"
#     answer = gets.chomp
#     answer
# end

puts 'Palyer ones name'
$player_one = gets.chomp

puts 'Palyer ones name'
$player_two = gets.chomp

puts "player one is #{$player_one} and player two is #{$player_two}"

def player_oner
  puts "#{$player_one}, what is your number?"
  answer = gets.chomp
  answer.to_i
end

def player_two
    puts "#{$player_two}, what is your number?"
    answer = gets.chomp
    answer.to_i
  end

#  i = $playing_numbers.length
#  j = 0

#   while j < i 
#     game = GameLogic.new
#     game.value_arr(:player_oner)
#     j +=1
#   end

    


# def congratulations
#     "Congratulations, you win!"
# end

logic = GameLogic.new
puts logic.value_arr(:player_oner)
puts logic.game($answer, :player_two)

# new_msg = Notification.new
# puts new_msg.messenger(:out_of_range)
# puts new_msg.messenger(:congratulations)
