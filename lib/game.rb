require 'rubygems'
require 'terminal-table/import'

class TicTacToe
  @@player_status = 1
  @@one_move = nil
  @@board_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@score_res = []

  attr_accessor :name, :nametwo

  def initialize(name, nametwo)
    @name = name
    @name_two = nametwo
  end

  def input # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    if @@player_status == 1
      puts " #{@name} Please Enter your Number between 1 and 9"
      @@one_move = gets.chomp
      if @@one_move.to_i < 1 || @@one_move.to_i > 9
        puts 'The number is out of range'
        input
      else
        verify_move
      end
    elsif @@player_status == 0
      puts " #{@name_two} Please Enter your Number between 1 and 9 "
      @@one_move = gets.chomp
      if @@one_move.to_i < 1 || @@one_move.to_i > 9
        puts 'The number is out of range '
        input
      else
        verify_move
     end
    end
  end

  def verify_move # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    if @@score_res.include?(@@one_move.to_i)
      puts 'Number already exists Please Enter another value '
      input

    elsif !@@score_res.include?(@@one_move) && @@player_status == 1
      @@board_numbers.map! { |val| val == @@one_move.to_i ? 'x' : val }
      @@board_numbers
      @@player_status = 0
      @@score_res << @@one_move.to_i
      print "Selected numbers are #{@@score_res}"
      create_table
    elsif !@@score_res.include?(@@one_move) && @@player_status == 0
      @@board_numbers.map! { |val| val == @@one_move.to_i ? '0' : val }
      @@board_numbers
      @@player_status = 1
      @@score_res << @@one_move.to_i
      print "Selected numbers are #{@@score_res}"
      create_table
    end
  end

  def create_table
    puts ' '
    t = table
    t << [@@board_numbers[0], @@board_numbers[1], @@board_numbers[2]]
    t.add_separator
    t << [@@board_numbers[3], @@board_numbers[4], @@board_numbers[5]]
    t.add_separator
    t << [@@board_numbers[6], @@board_numbers[7], @@board_numbers[8]]
    puts t
    winner
  end

  def winner # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
    if @@board_numbers[0] == @@board_numbers[1] && @@board_numbers[0] == @@board_numbers[2]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@board_numbers[3] == @@board_numbers[4] && @@board_numbers[3] == @@board_numbers[5]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@board_numbers[6] == @@board_numbers[7] && @@board_numbers[6] == @@board_numbers[8]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@board_numbers[0] == @@board_numbers[3] && @@board_numbers[0] == @@board_numbers[6]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@board_numbers[1] == @@board_numbers[4] && @@board_numbers[1] == @@board_numbers[7]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@board_numbers[2] == @@board_numbers[5] && @@board_numbers[2] == @@board_numbers[8]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@board_numbers[0] == @@board_numbers[4] && @@board_numbers[0] == @@board_numbers[8]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@board_numbers[2] == @@board_numbers[4] && @@board_numbers[2] == @@board_numbers[6]
      puts " #{@name} Has won the game" if @@player_status.zero?
      puts " #{@name_two} Has won the game" if @@player_status == 1
      restart if @@player_status.zero? || @@player_status == 1
    elsif @@score_res.length == 9
      puts 'It is a draw game!'
      restart
    else
      input
      end
  end

  def restart
    puts 'Game is over.Do you gus wanna Rumble again :)'
    puts " if yes press 'y'if no press 'n'"
    continue = gets.chomp
    if continue.downcase == 'y' || continue.downcase == 'yes'
      puts 'Alright! Lets do it'
      puts ' '
      @@player_status = 1
      @@one_move = nil
      @@board_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      @@score_res = []
      input
    else
      puts 'Alright Guys. Get out of here. Bunch of Cowards!!!'
    end
end
end
