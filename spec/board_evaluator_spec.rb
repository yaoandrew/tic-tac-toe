require 'board_evaluator'
require 'board'

describe BoardEvaluator, '#row_winner' do

  context 'When called and the board contains a winning row' do
    it 'Returns true' do
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
    it 'Returns false' do
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
    it 'Returns true' do
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
    it 'Returns false' do
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

describe BoardEvaluator, '#diagonal_winner?' do

  context 'When called and the board contains a winning main diagonal' do
    it 'Returns true' do
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
    it 'Returns true' do
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
    it 'Returns false' do
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
    it 'Returns false' do
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

describe BoardEvaluator, '#tied?' do

  context 'When called and the board is tied' do
    it 'Returns true' do
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
    it 'Returns false' do
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


describe BoardEvaluator, '#who_won' do

  context 'When called with a board' do
    it 'Returns the winner' do
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

describe BoardEvaluator, '#minimax' do

  context 'When minimax is called with an end state board' do
    it 'Returns -100 if O is the winner' do
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
    it 'Returns 100 if X is the winner' do
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
    it 'Returns 0 if the board is tied' do
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
    it 'Returns 99' do
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
    it 'Returns -99' do
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

describe BoardEvaluator, '#smart_move' do

  context 'When X can win the game in one move' do
    it 'Picks the winning spot' do
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
    it 'Picks the winning spot' do
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
