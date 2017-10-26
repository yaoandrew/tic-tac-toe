require 'player'

class HumanPlayer < Player

  def play_game(game, ui, board, board_evaluator)
    board = board.mark_cell(ui.move.to_i)
  end

end
