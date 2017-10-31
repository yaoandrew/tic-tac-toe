require 'player'

class HumanPlayer < Player

  def play_game(game, ui, board, board_evaluator)
    ui.show_player_turn(game.current_player)
    ui.prompt_player_for_move(board)
    ui.show_player_choice(game.current_player)
    ui.show_player_move
    board = board.mark_cell(ui.move.to_i)
  end

end
