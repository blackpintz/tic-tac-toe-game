require 'rubygems'
require 'terminal-table/import'
$num_arr = []
$playing_numbers = (1..9).to_a

class Player_one
  attr_accessor :name, :value
  def initialize(name, value)
    @name = name
    @value = value
  end
  
  def notification
    "#{@name}, what is your number"
  end
  
  def value_arr
    $num_arr.push(value)
    $num_arr
  end
end

class Player_two < Player_one
end