require_relative '../lib/user_interface'
require_relative '../lib/board'

describe UserInterface, '#draw_board' do

  context 'When draw_board is called' do
    it 'Draws the board with the correct arrangement' do
      ui = UserInterface.new
      board = Board.new(3)
      board.cells = %w( X - -
                        X - -
                        X - - )
      prompt = "X | - | -\n---------\nX | - | -\n---------\nX | - | -\n"
      expect{ui.draw_board(board)}.to output(prompt).to_stdout
    end
  end
end
