require_relative '../lib/board'
require_relative '../lib/board_evaluator'

describe Board, '#initialize' do

  board = Board.new

  context 'When the board is initialized with a size N' do
    it 'creates a N x N board' do
      result = board.length
      expect(result).to eq 9
    end
    it 'returns X as the current player' do
      expect(board.turn).to eq('X')
    end
  end
end

describe Board, '#get_cell' do

  context 'When the board has been initialized' do
    it 'returns the contents of a cell' do
      board = Board.new
      cell_num = 4
      result = board.get_cell(cell_num)
      expect(result).to eq(Board::EMPTY_CELL)
    end
  end
end

describe Board, '#mark_cell' do

  context 'When called with an index location' do
    it 'marks the board in the correct cell' do
      board = Board.new
      cell = 4
      result = board.mark_cell(cell)
      expect(result.cells).to eq(%w(- - - - X - - - -))
    end
  end
end

describe Board, '#cell_open?' do

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
      result = board.mark_cell(cell)
      expect(result.cell_open?(cell)).to eq false
    end
  end
end

describe Board, 'in_range?' do

  context 'When called with a location of a cell' do
    it 'returns true if the cell is in the valid range' do
      board = Board.new
      cell = 5
      result = board.in_range?(cell)
      expect(result).to eq true
    end
  end

  context 'When called with a location of a cell' do
    it 'returns false if the cell is out of the valid range' do
      board = Board.new
      cell = 15
      result = board.in_range?(cell)
      expect(result).to eq false
    end
  end
end

describe Board, '#empty_cells' do

  context 'When called' do
    it 'returns a collection of empty cells' do
      board = Board.new
      board.cells = %w( X O X
                        - - -
                        - - - )
      empty_cells = [3, 4, 5, 6, 7, 8]
      result = board.empty_cells
      expect(result).to eq empty_cells
    end
  end
end

describe Board, '#rows' do

  context 'When called' do
    it 'returns the collection of rows' do
      board = Board.new
      board.cells = %w( X X X
                        - - -
                        - - - )
      empty_row = [Board::EMPTY_CELL, Board::EMPTY_CELL, Board::EMPTY_CELL ]
      row_collection = [['X','X','X'], empty_row, empty_row]
      result = board.rows
      expect(result).to eq row_collection
    end
  end
end

describe Board, '#columns' do

  context 'When called' do
    it 'returns the collection of columns' do
      board = Board.new
      empty = Board::EMPTY_CELL
      board.cells = %w( X X X
                        - - -
                        - - - )
      column_collection = [['X',empty,empty], ['X',empty,empty], ['X',empty,empty]]
      result = board.columns
      expect(result).to eq column_collection
    end
  end
end
