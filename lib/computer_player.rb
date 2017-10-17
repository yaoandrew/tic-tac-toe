require_relative 'player'

class ComputerPlayer < Player

  def make_simple_move(board)
    simple_move = rand(0..8)
    until board.cell_open?(simple_move)
      simple_move = rand(0..8)
    end
    simple_move
  end

  def make_smart_move(board, board_evaluator)
    board_evaluator.smart_move(board)
  end

  def play_game(game, ui, board, board_evaluator)
    puts "The computer is thinking..."
    board = board.mark_cell(self.make_smart_move(board, board_evaluator))
  end

end
