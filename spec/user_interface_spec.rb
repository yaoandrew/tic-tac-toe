require_relative '../lib/user_interface'
require_relative '../lib/validator'
require_relative '../lib/board'

describe UserInterface do

  before(:each) do
    @mock_io = MockIO.new
    @mock_printer = lambda {|s| @mock_io.print s}
  end


  context 'When #draw_board is called' do
    it 'Draws the board with the correct arrangement' do
      validator = Validator.new
      ui = UserInterface.new(validator, @mock_printer)
      board = Board.new(3)
      board.cells = %w( X - -
                        X - -
                        X - - )

      expected = "X | - | -\n" +
                 "---------\n" +
                 "X | - | -\n" +
                 "---------\n" +
                 "X | - | -\n"

      ui.draw_board(board)
      expect(@mock_io.printed).to eq(expected)
    end
  end

  context 'When #draw_board_map is called' do
    it 'Draws a map of the board and spaces' do
      validator = Validator.new
      ui = UserInterface.new(validator, @mock_printer)

      expected = "0 | 1 | 2\n" +
                 "---------\n" +
                 "3 | 4 | 5\n" +
                 "---------\n" +
                 "6 | 7 | 8\n"
      
      ui.draw_board_map
      expect(@mock_io.printed).to eq(expected)
    end
  end

  context 'When #welcome is called' do
    it 'Prints the welcome message' do
      validator = Validator.new
      ui = UserInterface.new(validator, @mock_printer)
      
      expected = "Let's play tic tac toe"

      ui.welcome
      expect(@mock_io.printed).to eq(expected)
    end
  end

  class MockIO
    attr_reader :printed

    def initialize()
      @printed = ""
    end

    def print(string)
      @printed << string
    end
  end

end
