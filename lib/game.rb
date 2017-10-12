class Game

  attr_reader :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def toggle_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def game_over?(board, board_evaluator)
    board_evaluator.row_winner?(board) || board_evaluator.column_winner?(board) ||
      board_evaluator.diagonal_winner?(board) || board_evaluator.tied?(board)
  end

  def winner(board, board_evaluator)
    board_evaluator.who_won(board)
  end

end
