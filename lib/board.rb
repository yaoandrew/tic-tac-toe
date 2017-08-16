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

end
