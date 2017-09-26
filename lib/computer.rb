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

end
