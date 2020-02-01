module GameOfLife
  class Cell
    attr_reader :world, :x, :y, :live
    alias :live? :live

    def initialize(world, x, y)
      @world = world
      @x = x
      @y = y
      @live = false
    end

    def toggle
      @live = !@live
    end
  end
end
