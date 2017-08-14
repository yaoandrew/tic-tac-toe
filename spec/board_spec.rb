require_relative '../lib/board'

RSpec.describe Board, '#initialize' do
  context 'When the board is initialized' do
    it 'creates a 3 x 3 board' do
      board = Board.new
      result = board.length
      expect(result).to eq 9
    end
  end
end

RSpec.describe Board, '#display_cell' do
  context 'When the board has been initialized' do
    it 'returns the contents of an empty cell' do
      board = Board.new
      empty_cell_token = "-"
      cell_num = 4
      result = board.display_cell(cell_num)
      expect(result).to eq(empty_cell_token)
    end
  end
end

RSpec.describe Board, '#mark_cell' do
  context 'When called with a location and marker' do
    it 'marks the board in the correct cell' do
      board = Board.new
      cell = 4
      marker = "X"
      board.mark_cell(cell, marker)
      result = board.display_cell(cell)
      expect(result).to eq(marker)
    end
  end
end

RSpec.describe Board, '#cell_open?' do
  context 'When called with a location of an unmarked cell' do
    it 'returns true' do
      board = Board.new
      cell = 4
      result = board.cell_open?(cell)
      expect(result).to eq true
    end
  end
  context 'When called with a location of a marked cell' do
    it 'returns false' do
      board = Board.new
      cell = 4
      board.mark_cell(cell, "X")
      result = board.cell_open?(cell)
      expect(result).to eq false
    end
  end
end
