class Board

  EMPTY_CELL = '-'

  attr_accessor :cells, :turn

  def initialize(cells=nil, turn= "X")
    @size = 3
    @cells = cells || Array.new(@size**2, EMPTY_CELL)
    @turn = turn
  end

  def length
    @cells.length
  end

  def display_cell(cell)
    @cells[cell]
  end

  def mark_cell(cell)
    board = Board.new(@cells.dup, xturn("O", "X"))
    board.cells[cell] = turn
    board
  end

  def cell_open?(cell)
    @cells[cell] == EMPTY_CELL
  end

  def empty_cells
    @cells.each_index.select { |index| @cells[index] == '-' }
  end

  def rows
    @cells.each_slice(@size).to_a
  end

  def columns
    @cells.each_slice(@size).to_a.transpose
  end

  def main_diagonal
    0.step(@cells.length - 1, @size + 1 ).map { |x| @cells[x] }
  end

  def anti_diagonal
    (@size - 1).step(@cells.length - @size, @size - 1).map { |x| @cells[x] }
  end

  def diagonals
    [main_diagonal, anti_diagonal]
  end

  def row_winner?
    rows.any? { |row| row.all? { |x| row[0] == x && x != EMPTY_CELL }}
  end

  def column_winner?
    columns.any? { |column| column.all? { |x| column[0] == x && x != EMPTY_CELL }}
  end

  def diagonal_winner?
    diagonals.any? { |diagonal| diagonal.all? { |x| diagonal[1] == x && x != EMPTY_CELL }}
  end

  def tied?
    @cells.all? { |cell| cell != EMPTY_CELL } && !any_winner?
  end

  def any_winner?
    row_winner? || column_winner? || diagonal_winner?
  end

  def who_won
    if column_winner?
      columns.find { |column| column.all? { |x| column[0] == x } }.first
    elsif row_winner?
      rows.find { |row| row.all? { |x| row[0] == x } }.first
    elsif diagonal_winner?
      diagonals.find { |diagonal| diagonal.all? { |x| diagonal[0] == x } }.first
    end
  end

  def toggle_player_turn
    if empty_cells.length.even?
      return "O"
    else
      return "X"
    end
  end

  def xturn(x, o)
    @turn == "X" ? x : o
  end

  def minimax(depth=1)
    return 100 if who_won == "X"
    return -100 if who_won == "O"
    return 0 if tied?

    empty_cells.map { |index|
      mark_cell(index).minimax(depth+1) }
      .send(xturn(:max, :min)) + xturn(-depth, depth)
  end

  def smart_move
    empty_cells.send (xturn(:max_by, :min_by)) { |index| mark_cell(index).minimax }
  end

end
