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

  def get_cell(cell)
    @cells[cell] == EMPTY_CELL ? cell.to_s : @cells[cell]
  end

  def mark_cell(cell)
    board = Board.new(@cells.dup, xturn("O", "X"))
    board.cells[cell] = turn
    board
  end

  def cell_open?(cell)
    @cells[cell] == EMPTY_CELL
  end

  def in_range?(cell)
    (0..8).include?(cell)
  end

  def empty_cells
    @cells.each_index.select { |index| @cells[index] == EMPTY_CELL }
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

  def xturn(x, o)
    @turn == "X" ? x : o
  end

end
