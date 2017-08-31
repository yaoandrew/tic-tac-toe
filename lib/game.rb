class Game

  attr_reader :player1, :player2, :board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def first_player
    if @player1.order == 1
      @player1
    else
      @player2
    end
  end

  def game_over?
    @board.row_winner? || @board.column_winner? ||
      @board.diagonal_winner? || @board.tied?
  end

  def winner
    @board.who_won
  end

end
