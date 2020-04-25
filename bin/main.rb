#!/usr/bin/env ruby

require_relative '../lib/game.rb'

puts 'Player One Enter your name!!'

player_one = gets.chomp

puts 'Player Two Enter your name!!'

player_two = gets.chomp

puts "player One is #{player_one} and palyer two is #{player_two} "

alican = TicTacToe.new(player_one, player_two)

alican.input
