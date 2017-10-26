require 'player'

class ComputerPlayer < Player

  def make_smart_move(board, board_evaluator)
    board_evaluator.smart_move(board)
  end

  def play_game(game, ui, board, board_evaluator)
    board = board.mark_cell(board_evaluator.smart_move(board))
  end

end
