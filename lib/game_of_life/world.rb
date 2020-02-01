module GameOfLife
  class World
    attr_reader :cells

    def initialize(width, height)
      @cells = []
      height.times do |x|
        @cells.push([])
        width.times do |y|
          @cells[x].push(Cell.new(self, x, y))
        end
      end
    end
  end
end
