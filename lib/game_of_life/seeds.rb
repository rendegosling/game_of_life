module GameOfLife
  class Seeds
    def self.boat
      boat = Array.new(5) { Array.new(5) }
      boat[1][2] = "X"
      boat[2][1] = "X"
      boat[2][3] = "X"
      boat[3][2] = "X"
      boat[3][3] = "X"
      boat
    end
  end
end
