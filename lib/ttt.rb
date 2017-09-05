#!/usr/local/bin/ruby

require_relative 'user_interface'
require_relative 'game'
require_relative 'player'
require_relative 'board'

ui = UserInterface.new

ui.welcome
ui.prompt_user_for_game_type
ui.prompt_user_for_mark
ui.prompt_user_for_order
puts "You chose to be #{ui.mark}. Let's GO!"
puts "Choose your move by picking the number that corresponds with the space you want."
ui.draw_board_map

board = Board.new(3)
player1 = Player.new(ui.mark, :human, 1)
player2 = Player.new('O', :computer, 2)
game = Game.new(player1, player2, board)

until game.game_over? do
  puts "Its time for #{game.current_player.symbol} to go"
  ui.prompt_player_for_move
  puts "#{game.current_player.symbol} has chosen"
  puts "Your move is #{ui.move}"
  board.mark_cell(ui.move.to_i, game.current_player.symbol)
  ui.draw_board(board)
  game.toggle_player
end

puts "#{game.winner} has won the game!"
