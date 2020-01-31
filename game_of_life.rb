require './game_of_life/game.rb'
require './game_of_life/seeds.rb'

game = GameOfLife::Game.new(20, 20)
game.start
