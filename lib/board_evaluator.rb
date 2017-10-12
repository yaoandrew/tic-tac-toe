class BoardEvaluator

  def row_winner?(board)
    board.rows.any? { |row| row.all? { |x| row[0] == x && x != Board::EMPTY_CELL }}
  end

  def column_winner?(board)
    board.columns.any? { |column| column.all? { |x| column[0] == x && x != Board::EMPTY_CELL }}
  end

  def diagonal_winner?(board)
    board.diagonals.any? { |diagonal| diagonal.all? { |x| diagonal[1] == x && x != Board::EMPTY_CELL }}
  end

  def any_winner?(board)
    row_winner?(board) || column_winner?(board) || diagonal_winner?(board)
  end

  def tied?(board)
    board.cells.all? { |cell| cell != Board::EMPTY_CELL } && !any_winner?(board)
  end

  def who_won(board)
    if column_winner?(board)
      board.columns.find { |column| column.all? { |x| column[0] == x } }.first
    elsif row_winner?(board)
      board.rows.find { |row| row.all? { |x| row[0] == x } }.first
    elsif diagonal_winner?(board)
      board.diagonals.find { |diagonal| diagonal.all? { |x| diagonal[0] == x } }.first
    end
  end

  def minimax(depth=1, board)
    return 100 if who_won(board) == "X"
    return -100 if who_won(board) == "O"
    return 0 if tied?(board)
    @@minicache ||= {}
    score = @@minicache[board.cells]
    return score unless score.nil?

    @@minicache[board.cells] = board.empty_cells.map { |index|
      minimax(depth+1, board.mark_cell(index)) }
        .send(board.xturn(:max, :min)) + board.xturn(-depth, depth)
  end

  def smart_move(board)
    board.empty_cells.send (board.xturn(:max_by, :min_by)) { |index| minimax(board.mark_cell(index)) }
  end

end
