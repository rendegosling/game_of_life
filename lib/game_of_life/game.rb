require 'colorize'
require 'byebug'
require 'tty-box'

module GameOfLife
  class Game
    def initialize(world_width, world_height)
      @world_width = world_width
      @world_height = world_height
    end

    def start
      puts 'Game Started!'
      @world = GameOfLife::World.new(@world_width, @world_height)
    end

    def clear_screen
      system('clear')
    end
  end
end
