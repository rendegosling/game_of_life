require File.expand_path('../game_of_life/game', __FILE__)
require File.expand_path('../game_of_life/world', __FILE__)
require File.expand_path('../game_of_life/cell', __FILE__)

GameOfLife::Game.new(20, 20).start
