require 'game'
require 'player'
require 'human_player'
require 'computer_player'
require 'validator'
require 'user_interface'
require 'board'
require 'board_evaluator'

describe Game, '#toggle_player' do

  context 'When the current player is Player1' do
    it 'Changes the current player to Player2' do
      player1 = Player.new('X')
      player2 = Player.new('O')
      game = Game.new(player1, player2)

      game.toggle_player
      expect(game.current_player).to eq player2
    end
  end
end

describe Game, '#get_game_prompts' do

  context 'When the current player is a Human player' do
    it 'Shows the screen prompts for a human player' do
      validator = Validator.new
      ui = UserInterface.new(validator)
      board = Board.new
      board_evaluator = BoardEvaluator.new
      player1 = HumanPlayer.new('X')
      player2 = ComputerPlayer.new('O')
      game = Game.new(player1, player2)
      game.get_game_prompts(ui, board, board_evaluator)
    end
  end

  context 'When the current player is a Computer player' do
    it 'Shows the screen prompts for a computer player' do
      validator = Validator.new
      ui = UserInterface.new(validator)
      board = Board.new
      board_evaluator = BoardEvaluator.new
      player1 = HumanPlayer.new('X')
      player2 = ComputerPlayer.new('O')
      game = Game.new(player1, player2)
      game.toggle_player
      prompt = "The computer is thinking..."
      result = game.get_game_prompts(ui, board, board_evaluator)

      expect{result}.to output(prompt).to_stdout
    end
  end
end

describe Game, '#game_over?' do

  context 'When there is a winner' do
    it 'Returns true' do
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
    it 'Returns true' do
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
    it 'Returns false' do
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
    it 'Returns the mark of the winner- X' do
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
    it 'Returns the mark of the winner- O' do
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
    it 'Returns the mark of the winner- X' do
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
    it 'Returns nil' do
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
