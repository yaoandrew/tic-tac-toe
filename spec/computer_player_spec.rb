require_relative '../lib/computer_player'
require_relative '../lib/board'

describe ComputerPlayer, '#make_simple_move' do
  context 'When the computer is asked' do
    it 'makes a simple move' do
      symbol = 'O'
      computer_player = ComputerPlayer.new(symbol)
      board = Board.new
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = computer_player.make_simple_move(board)
      expect(result).to be > 2
    end
  end
end
