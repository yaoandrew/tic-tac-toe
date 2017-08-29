class Player

  attr_reader :symbol, :type, :order

  def initialize(symbol, type, order)
    @symbol = symbol
    @type = type
    @order = order
  end

  def make_move
    3
  end
end
