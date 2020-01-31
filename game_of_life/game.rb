require 'colorize'

module GameOfLife
  class Game
    def initialize(world_width, world_height)
      @world_width = world_width
      @world_height = world_height
    end

    def start
      clear_screen
      clear_world
      puts 'Game started!'

      draw_seed
      draw_world

      300.times do
        tick
      end
    end

    def tick
      clear_screen
      puts 'Game started!'
      clone_world
      clear_world
      generate
      draw_world
      sleep(1 / 5)
    end

    def generate
      @world_clone.each_with_index do |x, xi|
        x.each_with_index do |y, yi|
          neighbor_count = count_neighbors(xi, yi)
          if y == 'X'
            @world[xi][yi] = 'X' if [2, 3].include? neighbor_count
          elsif neighbor_count == 3
            @world[xi][yi] = 'X'
          end
        end
      end
    end

    def count_neighbors(x_axis, y_axis)
      count = 0
      (-1..1).each do |i|
        (-1..1).each do |j|
          x = x_axis - i
          y = y_axis - j
          next if (x == x_axis && y == y_axis) || x < 0 || y < 0 || x >= @world_width || y >= @world_height
          count += 1 if @world_clone[x][y] == 'X'
        end
      end
      count
    end

    def clone_world
      @world_clone = Marshal.load(Marshal.dump(@world))
    end

    def draw_seed
      seed_x = 2
      seed_y = 2
      seed = GameOfLife::Seeds.boat
      seed.each_with_index do |x, xi|
        x.each_with_index do |y, yi|
          @world[seed_x + xi][seed_y + yi] = 'X' if y == 'X'
        end
      end
    end

    def draw_world
      @world.each do |r|
        puts r.each { |p| p }.join(' ')
      end
    end

    def clear_world
      @world = nil
      @world = Array.new(@world_height) { Array.new(@world_width) }
    end

    def clear_screen
      system('clear')
    end
  end
end
