class Computer

  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_simple_move(board)
    simple_move = rand(0..8)
    until board.cell_open?(simple_move)
      simple_move = rand(0..8)
    end
    simple_move
  end

  def minimax(board)
    return 100 if board.who_won == "O"
    return -100 if board.who_won == "X"
    return 0 if board.tied?

    board.empty_cells.map do |empty_cell|
      newboard = board.mark_cell(empty_cell, "X")
      minimax(newboard)
    end
  end

  # use for debugging and remove
  def draw_board(board)
    puts "=========="
    puts "=========="
    puts board.display_cell(0) + " | " + board.display_cell(1) + " | " + board.display_cell(2)
    puts "---------"
    puts board.display_cell(3) + " | " + board.display_cell(4) + " | " + board.display_cell(5)
    puts "---------"
    puts board.display_cell(6) + " | " + board.display_cell(7) + " | " + board.display_cell(8)
  end

end
