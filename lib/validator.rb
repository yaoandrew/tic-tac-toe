class Validator
  VALID_GAMES = [ 1, 2, 3 ]

  def valid_game?(game_type)
    VALID_GAMES.any? { |game| game == game_type }
  end

  def valid_move?(board, cell)
    board.in_range?(cell) && board.cell_open?(cell)
  end
end
