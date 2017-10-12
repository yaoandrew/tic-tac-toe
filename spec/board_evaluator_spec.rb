require_relative '../lib/board_evaluator'
require_relative '../lib/board'

describe BoardEvaluator, '#row_winner' do
  
  context 'When called and the board contains a winning row' do
    it 'returns true' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = board_evaluator.row_winner?(board)
      expect(result).to eq true
    end
  end

  context 'When called and the board does not contain a winning row' do
    it 'returns false' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X O X
                        - - -
                        - - - )
      result = board_evaluator.row_winner?(board)
      expect(result).to eq false
    end
  end
end

describe BoardEvaluator, '#column_winner?' do

  context 'When called and the board contains a winning column' do
    it 'returns true' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X - -
                        X - -
                        X - - )
      result = board_evaluator.column_winner?(board)
      expect(result).to eq true
    end
  end

  context 'When called and the board does not contain a winning column' do
    it 'returns false' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X O X
                        - - -
                        - - - )
      result = board_evaluator.column_winner?(board)
      expect(result).to eq false
    end
  end
end

describe Board, '#diagonal_winner?' do

  context 'When called and the board contains a winning main diagonal' do
    it 'returns true' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( O - -
                        - O -
                        - - O )
      result = board_evaluator.diagonal_winner?(board)
      expect(result).to eq true
    end
  end

  context 'When called and the board contains a winning anti-diagonal' do
    it 'returns true' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( - - X
                        - X -
                        X - - )
      result = board_evaluator.diagonal_winner?(board)
      expect(result).to eq true
    end
  end

  context 'When called and the board does not contain a winning main diagonal' do
    it 'returns false' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( O O O
                        - - -
                        - - - )
      result = board_evaluator.diagonal_winner?(board)
      expect(result).to eq false
    end
  end

  context 'When called and the board does not contain a winning anti-diagonal' do
    it 'returns false' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( - - -
                        - - -
                        X X X )

      result = board_evaluator.diagonal_winner?(board)
      expect(result).to eq false
    end
  end
end

describe Board, '#tied?' do

  context 'When called and the board is tied' do
    it 'returns true' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( O X O
                        X X O
                        X O X )

      result = board_evaluator.tied?(board)
      expect(result).to eq true
    end
  end

  context 'When called and the board is not tied' do
    it 'returns false' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( O X O
                        X X O
                        X X - )

      result = board_evaluator.tied?(board)
      expect(result).to eq false
    end
  end
end


describe Board, '#who_won' do

  context 'When called with a board' do
    it 'returns the winner' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = board_evaluator.who_won(board)

      expect(result).to eq "X"
    end
  end
end

describe Board, '#minimax' do
  
  context 'When minimax is called with an end state board' do
    it 'returns -100 if O is the winner' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( O O O
                        - - -
                        - - - )
      result = board_evaluator.minimax(board)

      expect(result).to eq (-100)
    end
  end
  
  context 'When minimax is called with an end state board' do
    it 'returns 100 if X is the winner' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = board_evaluator.minimax(board)

      expect(result).to eq (100)
    end
  end

  context 'When minimax is called with an end state board' do
    it 'returns 0 if the board is tied' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X O O
                        O X X
                        X X O )
      result = board_evaluator.minimax(board)
      expect(result).to eq 0
    end
  end

  context 'When minimax is called with a board X can win' do
    it 'returns 99' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X - -
                        X - -
                        - - - )
      result = board_evaluator.minimax(board)
      expect(result).to eq (99)
    end
  end

  context 'When minimax is called with a board O can win' do
    it 'returns -99' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.turn = "O"
      board.cells = %w( O - -
                        O - -
                        - - - )
      result = board_evaluator.minimax(board)
      expect(result).to eq (-99)
    end
  end

end

describe Board, '#smart_move' do

  context 'When X can win the game in one move' do
    it 'picks the winning spot' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.cells = %w( X - -
                        X - -
                        - - - )
      result = board_evaluator.smart_move(board)
      expect(result).to eq 6
    end
  end

  context 'When O can win the game in one move' do
    it 'picks the winning spot' do
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.turn = "O"
      board.cells = %w( O - -
                        O - -
                        - - - )
      result = board_evaluator.smart_move(board)
      expect(result).to eq 6
    end
  end
end
