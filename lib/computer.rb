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

  def make_smart_move(board)
    board.smart_move
  end

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
