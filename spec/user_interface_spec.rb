require_relative '../lib/user_interface'
require_relative '../lib/validator'
require_relative '../lib/board'

describe UserInterface, '#draw_board' do

  context 'When draw_board is called' do
    it 'Draws the board with the correct arrangement' do
      validator = Validator.new
      ui = UserInterface.new(validator)
      board = Board.new(3)
      board.cells = %w( X - -
                        X - -
                        X - - )
      prompt = "X | - | -\n---------\nX | - | -\n---------\nX | - | -\n"
      expect{ui.draw_board(board)}.to output(prompt).to_stdout
    end
  end
end
