class Player

  attr_accessor :symbol, :type, :order

  def initialize(symbol, type, order)
    @symbol = symbol
    @type = type
    @order = order
  end

  def make_move
    3
  end

end
