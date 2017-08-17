class Board
  def initialize(size)
    @size = size
    @cells = Array.new(size**2, "-")
  end

  def length
    @cells.length
  end

  def display_cell(cell)
    @cells[cell]
  end

  def mark_cell(cell, symbol)
    @cells[cell] = symbol
  end

  def cell_open?(cell)
    @cells[cell] == '-'
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
  
  def row_winner?
    rows.any? { |row| row.all? { |x| row[0] == x && x != "-" }}
  end

  def column_winner?
    columns.any? { |column| column.all? { |x| column[0] == x && x != "-" }}
  end

  def diagonal_winner?
    diagonals = [main_diagonal, anti_diagonal]
    diagonals.any? { |diagonal| diagonal.all? { |x| diagonal[1] == x && x != "-" }}
  end
end
