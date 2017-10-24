#!/usr/local/bin/ruby

lib = File.expand_path('.', __dir__)
$:.unshift(lib) unless $:.include?(lib)

require 'user_interface'
require 'game_factory'
require 'board'
require 'validator'
require 'board_evaluator'

validator = Validator.new
board_evaluator = BoardEvaluator.new
ui = UserInterface.new(validator)
board = Board.new
game_factory = GameFactory.new

ui.welcome
ui.prompt_user_for_game_type
ui.get_game_type
ui.draw_board_map

game = game_factory.create_game(ui.game_type.to_i)

until game.game_over?(board, board_evaluator) do

  board = game.current_player.play_game(game, ui, board, board_evaluator)
  ui.draw_board(board)
  game.toggle_player

end

ui.show_winner(game, board, board_evaluator)
