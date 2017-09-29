require_relative '../lib/validator'
require_relative '../lib/board'

describe Validator, '#valid_game?' do

  context 'When called to validate a type of game' do
    it 'returns true if the game is valid' do
      validator = Validator.new
      game_type = 2
      result = validator.valid_game?(game_type)
      expect(result).to be true
    end
  end

  context 'When called to validate a type of game' do
    it 'returns false if the game is not valid' do
      validator = Validator.new
      game_type = 5
      result = validator.valid_game?(game_type)
      expect(result).to be false
    end
  end
end

describe Validator, '#valid_move?' do

  context "When called to check if the move is in an open and valid cell" do
    it 'returns true if the cell is open and in range' do
      board = Board.new
      validator = Validator.new
      board.cells = %w( O O O
                        - - -
                        - - - )
      cell = 5
      result = validator.valid_move?(board, cell)
      expect(result). to be true
    end
  end

  context "When called to check if the move is in an open and valid cell" do
    it 'returns false if the cell is not open or in range' do
      board = Board.new
      validator = Validator.new
      board.cells = %w( O O O
                        - - -
                        - - - )
      cell = 2
      result = validator.valid_move?(board, cell)
      expect(result). to be false
    end
  end
end
