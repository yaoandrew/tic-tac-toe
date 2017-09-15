require_relative '../lib/computer'
require_relative '../lib/board'

describe Computer, '#make_simple_move' do
  context 'When the computer is asked' do
    it 'makes a simple move' do
      symbol = 'O'
      computer = Computer.new(symbol)
      board = Board.new
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = computer.make_simple_move(board)
      expect(result).to be > 2
    end
  end
end
