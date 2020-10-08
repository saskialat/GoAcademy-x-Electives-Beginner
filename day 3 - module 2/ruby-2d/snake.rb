# SASKIA LATIEVARYA
# Friday, August 28, 2020
# Create a snake game
# The snake will move on a 2D biard
# Snake can move using arrow buttons on keyboard
# Beginning:
# - 1 Food
# - 1 Stone
# Everytime a snake eats 1 food, 1 food and 1 stone will spawn randomly
# Snake will die if:
# - hits own body stone/ Wall
# Symbols:
# - Snake: Rectangle
# - Food: Circle
# - Stone: Triangle
# - Wall: cross

# NOT COMPLETED


require 'ruby2d'
# require 'io/console'

set title: 'Speedy Snake', #viewport_height: 896 , viewport_width: 414,

class Snake
  def initialize
    @snake = Rectangle.new(
      x: 125, y: 250,
      width: 200, height: 150,
      color: 'olive',
      z: 20
    )
    # source: https://www.ruby2d.com/learn/2d-basics/
    # Define the initial speed (and direction).
    @x_speed = 0
    @y_speed = 0

    # Define what happens when a specific key is pressed.
    # Each keypress influences on the  movement along the x and y axis.
    on :key_down do |event|
      if event.key == 'j'
        @x_speed = -2
        @y_speed = 0
      elsif event.key == 'l'
        @x_speed = 2
        @y_speed = 0
      elsif event.key == 'i'
        @x_speed = 0
        @y_speed = -2
      elsif event.key == 'k'
        @x_speed = 0
        @y_speed = 2
      end
    end

    update do
      @snake.x += @x_speed
      @snake.y += @y_speed
    end
    show
  end

  def hits(objects)?
  end

  def eats(food)?
  end

end

class Food
  def initialize
    Circle.new(
      x: 200, y: 175,
      radius: 150,
      sectors: 32,
      color: 'red',
      z: 10
    )
    show
  end
end

class Stone
  def initialize
    Triangle.new(
      x: 125, y: 250,
      width: 200, height: 150,
      color: 'gray',
      z: 20
    )
    show
  end
end

class Wall
  def initialize
    Cross.new(
      #initialize cross shape
    )
    show
  end
end

class Game
  attr_accessor :snake, :food, :stone, :wall, :spawn_stone, :spawn_food
  def start
    
    @food = Food.new
    @stone = Stone.new
    @wall = Wall.new
    @items = [@stone, @wall]
    @all_food = [food]
    @snake = Snake.new
    
    end
  end

  def game_over?
    if @snake.hits(items)?
      return false
    else
      return true
    end
  end

  def play
    while ! game_over?
      if @snake.eats([all_food])
        all_food.pop # delete food
        @spawn_stone = Stone.new
        @spawn_food = Food.new
        items << spawn_stone
        all_food << spawn_food
      end
    end
  end

end




# # Source: https://gist.github.com/acook/4190379
# # Reads keypresses from the user including 2 and 3 escape character sequences.
# def read_char
#     STDIN.echo = false
#     STDIN.raw!
  
#     input = STDIN.getc.chr
#     if input == "\e" then
#       input << STDIN.read_nonblock(3) rescue nil
#       input << STDIN.read_nonblock(2) rescue nil
#     end
# ensure
# STDIN.echo = true
# STDIN.cooked!

# return input
# end

# # Source: https://www.ruby2d.com/learn/2d-basics/
# # Define a square shape.
# @square = Square.new(x: 10, y: 20, size: 25, color: 'blue')

# # Define the initial speed (and direction).
# @x_speed = 0
# @y_speed = 0

# # Define what happens when a specific key is pressed.
# # Each keypress influences on the  movement along the x and y axis.
# on :key_down do |event|
#   if read_char == "\e[D"
#     @x_speed = -2
#     @y_speed = 0
#   elsif read_char == 'l'
#     @x_speed = 2
#     @y_speed = 0
#   elsif read_char == "\e[A"
#     @x_speed = 0
#     @y_speed = -2
#   elsif read_char == "\e[C"
#     @x_speed = 0
#     @y_speed = 2
#   end
# end

# update do
#   @square.x += @x_speed
#   @square.y += @y_speed
# end

# show


# =begin

# SOURCE

# moving square https://www.ruby2d.com/learn/2d-basics/
# key https://gist.github.com/acook/4190379

# =end