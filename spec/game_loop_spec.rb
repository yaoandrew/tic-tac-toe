require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/board_evaluator'


describe Game, '#game_over?' do

  context 'When there is a winner' do
    it 'Should return true' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      board = Board.new
      board_evaluator = BoardEvaluator.new
      game = Game.new(player1, player2)
      board.cells = %w( X X X
                        - - -
                        - - - )
      expect(game.game_over?(board, board_evaluator)).to be true
    end
  end

  context 'Where there is a tie' do
    it 'Should return true' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      board = Board.new
      board_evaluator = BoardEvaluator.new
      game = Game.new(player1, player2)
      board.cells = %w( O X O
                        X X O
                        X O X )
      expect(game.game_over?(board, board_evaluator)).to be true
    end
  end

  context 'Where there is no tie and no winner' do
    it 'Should return false' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      board = Board.new
      board_evaluator = BoardEvaluator.new
      game = Game.new(player1, player2)
      board.cells = %w( O X O
                        - - -
                        - - - )
      expect(game.game_over?(board, board_evaluator)).to be false
    end
  end
end

describe Game, '#winner' do

  context 'When the winner is a column winner' do
    it 'returns the mark of the winner- X' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      board = Board.new
      board_evaluator = BoardEvaluator.new
      game = Game.new(player1, player2)
      board.cells = %w( O X O
                        - X -
                        O X - )
      result = game.winner(board, board_evaluator)
      expect(result).to eq('X')
    end
  end

  context 'When the winner is a row winner' do
    it 'returns the mark of the winner- O' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      board = Board.new
      board_evaluator = BoardEvaluator.new
      game = Game.new(player1, player2)
      board.cells = %w( O O O
                        - X -
                        X X - )
      result = game.winner(board, board_evaluator)
      expect(result).to eq('O')
    end
  end

  context 'When the winner is a diagonal winner' do
    it 'returns the mark of the winner- X' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      board = Board.new
      board_evaluator = BoardEvaluator.new
      game = Game.new(player1, player2)
      board.cells = %w( X O -
                        O X -
                        - O X )
      result = game.winner(board, board_evaluator)
      expect(result).to eq('X')
    end
  end

  context 'When there is not a winner' do
    it 'returns nil' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      board = Board.new
      board_evaluator = BoardEvaluator.new
      game = Game.new(player1, player2)
      board.cells = %w( O X O
                        - - -
                        - - - )
      result = game.winner(board, board_evaluator)
      expect(result).to be nil
    end
  end
end
