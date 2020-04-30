#!/usr/bin/env ruby

require_relative '../lib/game.rb'

puts 'Name of Player one'
$player_one = gets.chomp

puts 'Name of Player two'
$player_two = gets.chomp

puts "player one is #{$player_one} and player two is #{$player_two}"

def game_func(arr)
  i = arr.length + 1
  while i.positive?
    if $player_status == 1
      puts "#{$player_one}, what is your number?"
      answer = gets.chomp
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr)
      else
        arr << answer.to_i
        print arr
        puts ''
        Player_one.new(answer)
      end
    else
      puts "#{$player_two}, what is your number?"
      answer = gets.chomp.to_i
      if answer.to_i < 1 || answer.to_i > 9
        puts 'Number is out of range'
        game_func(arr)
      elsif arr.include?(answer.to_i)
        puts 'Number already selected'
        game_func(arr)
      else
        arr << answer.to_i
        print arr
        puts ''
        Player_two.new(answer)
      end
    end
    logic = GameLogic.new
    puts logic.game(answer)
    i += 1
    break if i == 10
  end
  puts arr.length
  if arr.length == 9
    def repeat
      puts 'Looks like its a dray game'
      puts 'Do you wanna play again,. Press y if yes and n if no'
      ans = gets.chomp
      if ans == 'y' || ans == 'yes'
        arr = []
        $playing_numbers = (1..9).to_a
        $player_status = 1
        $board_number = []
        game_func(arr)
      elsif ans == 'n' || ans == 'no'
        puts 'Alright Guys. Get out of here'
        exit
      else
        puts 'Please Enter y or n'
        repeat
      end
    end
    repeat
  end
end

puts game_func($num_arr)
