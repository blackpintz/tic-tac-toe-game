#!/usr/bin/env ruby

require_relative '../lib/game.rb'

# puts 'Player One Enter your name!!'

# player_one = gets.chomp

# puts 'Player Two Enter your name!!'

# player_two = gets.chomp

# puts "player One is #{player_one} and palyer two is #{player_two} "

# alican = TicTacToe.new(player_one, player_two)

# alican.input

def out_of_range
    puts "Your number is out of range"
    puts "Please enter another number?"
    answer = gets.chomp
    answer
end

def congratulations
    "Congratulations, you win!"
end

new_msg = Notification.new
puts new_msg.messenger(:out_of_range)
puts new_msg.messenger(:congratulations)