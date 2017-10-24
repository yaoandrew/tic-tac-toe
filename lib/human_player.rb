require 'player'

class HumanPlayer < Player

  def play_game(game, ui, board, board_evaluator)
    ui.show_player_turn(game)
    ui.prompt_player_for_move(board)
    ui.show_player_choice(game)
    ui.show_player_move
    board = board.mark_cell(ui.move.to_i)
  end

end
