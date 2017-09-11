class Computer

  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_simple_move(board)
    move = rand(0..8)
    until board.cell_open?(move)
      move = rand(0..8)
    end
    move
  end

  def make_smart_move(board)
  end

end
