require_relative 'player'

class ComputerPlayer < Player

  def make_smart_move(board, board_evaluator)
    board_evaluator.smart_move(board)
  end

  def play_game(game, ui, board, board_evaluator)
    ui.computer_thinking
    board = board.mark_cell(board_evaluator.smart_move(board))
  end

end
