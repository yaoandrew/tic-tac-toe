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

end
