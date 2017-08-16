require_relative '../lib/board'

RSpec.describe Board, '#initialize' do
  context 'When the board is initialized with a size N' do
    it 'creates a N x N board' do
      size = 3
      board = Board.new(size)
      result = board.length
      expect(result).to eq 9
    end
  end
end

RSpec.describe Board, '#display_cell' do
  context 'When the board has been initialized' do
    it 'returns the contents of an empty cell' do
      size = 3
      board = Board.new(size)
      empty_cell_token = "-"
      cell_num = 4
      result = board.display_cell(cell_num)
      expect(result).to eq(empty_cell_token)
    end
  end
  context 'When the board has been initialized' do
    it 'returns the contents of a marked cell' do
      size = 3
      board = Board.new(size)
      cell_num = 4
      symbol = "X"
      board.mark_cell(cell_num, symbol)
      result = board.display_cell(cell_num)
      expect(result).to eq(symbol)
    end
  end
end

RSpec.describe Board, '#mark_cell' do
  context 'When called with a location and symbol' do
    it 'marks the board in the correct cell' do
      size = 3
      board = Board.new(size)
      cell = 4
      symbol = "X"
      board.mark_cell(cell, symbol)
      result = board.display_cell(cell)
      expect(result).to eq(symbol)
    end
  end
end

RSpec.describe Board, '#cell_open?' do
  context 'When called with a location of an unmarked cell' do
    it 'returns true' do
      size = 3
      board = Board.new(size)
      cell = 4
      result = board.cell_open?(cell)
      expect(result).to eq true
    end
  end
  context 'When called with a location of a marked cell' do
    it 'returns false' do
      size = 3
      board = Board.new(size)
      cell = 4
      board.mark_cell(cell, "X")
      result = board.cell_open?(cell)
      expect(result).to eq false
    end
  end
end
