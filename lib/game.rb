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
    "#{@name}, what is your number?"
  end
  
  def value_arr
    $num_arr.push(value)
    $num_arr
  end
end

class Player_two < Player_one
end

class Board

  attr_accessor :arry_one, :arry_two, :arry_three
  def initialize(arry_one, arry_two, arry_three)
    @arry_one = arry_one
    @arry_two = arry_two
    @arry_three = arry_three
  end

  def draw_board
    t = table
    t << @arry_one
    t.add_separator
    t << @arry_two
    t.add_separator
    t << @arry_three
    t.add_separator
    t
  end

end

class Notification
def messenger(msg)
  method(msg).call
end
end


