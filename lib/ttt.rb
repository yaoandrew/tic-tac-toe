#!/usr/local/bin/ruby

require_relative 'user_interface'
require_relative 'game_factory'
require_relative 'board'
require_relative 'validator'
require_relative 'board_evaluator'

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
