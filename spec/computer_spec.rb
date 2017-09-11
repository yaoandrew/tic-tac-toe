require_relative '../lib/computer'
require_relative '../lib/board'

describe Computer, '#make_simple_move' do
  context 'When the computer is asked' do
    it 'makes a simple move' do
      symbol = 'O'
      computer = Computer.new(symbol)
      board = Board.new(3)
      board.mark_cell(0, 'X')
      board.mark_cell(1, 'X')
      board.mark_cell(2, 'X')
      result = computer.make_simple_move(board)
      expect(result).to be > 2
    end
  end
end
