#!/usr/local/bin/ruby

require_relative 'user_interface'
require_relative 'game'
require_relative 'player'
require_relative 'computer'
require_relative 'board'
require_relative 'validator'
require_relative 'board_evaluator'

validator = Validator.new
board_evaluator = BoardEvaluator.new
ui = UserInterface.new(validator)

ui.welcome
ui.prompt_user_for_game_type
ui.get_game_type
ui.draw_board_map

case ui.game_type.to_i
when 1
  board = Board.new
  player1 = Player.new('X')
  player2 = Player.new('O')
  game = Game.new(player1, player2)
when 2
  board = Board.new
  player1 = Player.new('X')
  player2 = Computer.new('O')
  game = Game.new(player1, player2)
when 3
  board = Board.new
  player1 = Computer.new('X')
  player2 = Computer.new('O')
  game = Game.new(player1, player2)
end

until game.game_over?(board, board_evaluator) do

  if game.current_player.is_a?(Player)
    puts "Its time for #{game.current_player.symbol} to go"
    ui.prompt_player_for_move(board)
    puts "#{game.current_player.symbol} has chosen"
    puts "Your move is #{ui.move}"
    board = board.mark_cell(ui.move.to_i)
    ui.draw_board(board)
  end

  if game.current_player.is_a?(Computer)
    puts "The computer is thinking..."
    board = board.mark_cell(game.current_player.make_smart_move(board))
    ui.draw_board(board)
  end

  game.toggle_player

end

ui.show_winner(board, game, board_evaluator)
