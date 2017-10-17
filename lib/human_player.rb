require_relative 'player'

class HumanPlayer < Player

  def play_game(game, ui, board, board_evaluator)
    puts "Its time for #{game.current_player.symbol} to go"
    ui.prompt_player_for_move(board)
    puts "#{game.current_player.symbol} has chosen"
    puts "Your move is #{ui.move}"
    board = board.mark_cell(ui.move.to_i)
  end

end
