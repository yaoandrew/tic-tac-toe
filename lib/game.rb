class Game

  attr_reader :player1, :player2, :board, :current_player

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @current_player = player1
  end

  def toggle_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def game_over?
    @board.row_winner? || @board.column_winner? ||
      @board.diagonal_winner? || @board.tied?
  end

  def winner
    @board.who_won
  end
end
