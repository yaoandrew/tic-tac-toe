class Board
  def initialize
    @cells = Array.new(9, "-")
  end

  def length
    @cells.length
  end

  def display_cell(cell)
    @cells[cell]
  end

  def mark(cell, marker)
    @cells[cell] = marker
  end

  def cell_open?(cell)
    @cells[cell] == '-'
  end
end
