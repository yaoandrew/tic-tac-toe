require_relative '../lib/computer_player'
require_relative '../lib/board'
require_relative '../lib/board_evaluator'
require_relative '../lib/user_interface'
require_relative '../lib/game'
require_relative '../lib/validator'

describe ComputerPlayer, '#make_smart_move' do

  context 'When the board has a nearly winning move by the opposing player' do
    it 'Makes a smart move that blocks the win' do
      symbol = 'O'
      computer_player = ComputerPlayer.new(symbol)
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.turn = Board::PLAYER_O
      board.cells = %w( X X -
                        - - -
                        - - - )
      result = computer_player.make_smart_move(board, board_evaluator)
      expect(result).to eq 2
    end
  end

  context 'When the board has a nearly winning move' do
    it 'Makes a smart move, that will win the game' do
      symbol = 'O'
      computer_player = ComputerPlayer.new(symbol)
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.turn = Board::PLAYER_O
      board.cells = %w( O X -
                        - O -
                        - - - )
      result = computer_player.make_smart_move(board, board_evaluator)
      expect(result).to eq 8
    end
  end

end

describe ComputerPlayer, '#play_game' do

  context 'When called with a game, ui, board, and board_evaluator' do
    it 'Returns a board with a move made' do
      player1 = ComputerPlayer.new('X')
      player2 = ComputerPlayer.new('O')
      validator = Validator.new
      game = Game.new(player1, player2)
      ui = UserInterface.new(validator)
      board = Board.new
      board_evaluator = BoardEvaluator.new
      board.turn = Board::PLAYER_O
      board.cells = %w( X O -
                        - - -
                        - - - )
      result = player2.play_game(game, ui, board, board_evaluator)
      expect(result.is_a?(Board)).to be true

    end
  end

end
