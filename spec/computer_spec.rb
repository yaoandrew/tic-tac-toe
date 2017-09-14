require_relative '../lib/computer'
require_relative '../lib/board'

describe Computer, '#make_simple_move' do
  context 'When the computer is asked' do
    it 'makes a simple move' do
      symbol = 'O'
      computer = Computer.new(symbol)
      board = Board.new(3)
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = computer.make_simple_move(board)
      expect(result).to be > 2
    end
  end
end

describe Computer, '#minimax' do
  context 'When minimax is called with an end state board' do
    it 'returns 1 if O is the winner' do
      symbol = 'O'
      computer = Computer.new(symbol)
      board = Board.new(3)
      board.cells = %w( O O O
                        - - -
                        - - - )
      result = computer.minimax(board)
      expect(result).to eq 100
    end
  end
  context 'When minimax is called with an end state board' do
    it 'returns -1 if X is the winner' do
      symbol = 'O'
      computer = Computer.new(symbol)
      board = Board.new(3)
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = computer.minimax(board)
      expect(result).to eq (-100)
    end
  end
  context 'When minimax is called with an end state board' do
    it 'returns 0 if the board is tied' do
      symbol = 'O'
      computer = Computer.new(symbol)
      board = Board.new(3)
      board.cells = %w( X O O
                        O X X
                        X X O )
      result = computer.minimax(board)
      expect(result).to eq 0
    end
  end
  xcontext 'When minimax is called with a near end state' do
    it 'returns -99 if X can with in the next move' do
      symbol = 'O'
      computer = Computer.new(symbol)
      board = Board.new(3)
      board.cells = %w( X X -
                        - - -
                        - - - )
      result = computer.minimax(board)
      expect(result).to eq (-99)
    end
  end
end
