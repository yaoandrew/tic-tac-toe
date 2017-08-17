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

  def row_winner?
    rows = @cells.each_slice(@size).to_a
    rows.any? { |row| row.all? { |x| row[0] == x && x != "-" }}
  end

  def column_winner?
    columns = @cells.each_slice(@size).to_a.transpose
    columns.any? { |column| column.all? { |x| column[0] == x && x != "-" }}
  end

  def diagonal_winner?
    main_diagonal = 0.step(@cells.length - 1, @size + 1 ).map { |x| @cells[x] }
    anti_diagonal = (@size - 1).step(@cells.length - @size, @size - 1).map { |x| @cells[x] }
    diagonals = [main_diagonal, anti_diagonal]
    diagonals.any? { |diagonal| diagonal.all? { |x| diagonal[1] == x && x != "-" }}
  end
end
