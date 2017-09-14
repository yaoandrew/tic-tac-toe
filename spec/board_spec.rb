require_relative '../lib/board'

BOARD_SIZE = 3

describe Board, '#initialize' do

  context 'When the board is initialized with a size N' do
    it 'creates a N x N board' do
      board = Board.new(BOARD_SIZE)
      result = board.length
      expect(result).to eq 9
    end
    it 'returns X as the current player' do
      board = Board.new(BOARD_SIZE)
      expect(board.turn).to eq('X')
    end
  end
end

describe Board, '#display_cell' do

  context 'When the board has been initialized' do
    it 'returns the contents of a cell' do
      board = Board.new(BOARD_SIZE)
      cell_num = 4
      result = board.display_cell(cell_num)
      expect(result).to eq(Board::EMPTY_CELL)
    end
  end
end

describe Board, '#mark_cell' do

  context 'When called with a location and symbol' do
    it 'marks the board in the correct cell' do
      board = Board.new(BOARD_SIZE)
      cell = 4
      symbol = 'X'
      board.mark_cell(cell)
      result = board.display_cell(cell)
      expect(result).to eq(symbol)
    end
  end
end

describe Board, '#cell_open?' do

  context 'When called with a location of an unmarked cell' do
    it 'returns true' do
      board = Board.new(BOARD_SIZE)
      cell = 4
      result = board.cell_open?(cell)
      expect(result).to eq true
    end
  end

  context 'When called with a location of a marked cell' do
    it 'returns false' do
      board = Board.new(BOARD_SIZE)
      cell = 4
      board.mark_cell(cell)
      result = board.cell_open?(cell)
      expect(result).to eq false
    end
  end
end

describe Board, '#empty_cells' do

  context 'When called' do
    it 'returns a collection of empty cells' do
      board = Board.new(BOARD_SIZE)
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
      board = Board.new(BOARD_SIZE)
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
      board = Board.new(BOARD_SIZE)
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

describe Board, '#row_winner?' do

  context 'When called and the board contains a winning row' do
    it 'returns true' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( X X X
                        - - -
                        - - - )
      result = board.row_winner?
      expect(result).to eq true
    end
  end

  context 'When called and the board does not contain a winning row' do
    it 'returns false' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( X O X
                        - - -
                        - - - )
      result = board.row_winner?
      expect(result).to eq false
    end
  end
end

describe Board, '#column_winner?' do

  context 'When called and the board contains a winning column' do
    it 'returns true' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( X - -
                        X - -
                        X - - )
      result = board.column_winner?
      expect(result).to eq true
    end
  end

  context 'When called and the board does not contain a winning column' do
    it 'returns false' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( X O X
                        - - -
                        - - - )
      result = board.column_winner?
      expect(result).to eq false
    end
  end
end

describe Board, '#diagonal_winner?' do

  context 'When called and the board contains a winning main diagonal' do
    it 'returns true' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( O - -
                        - O -
                        - - O )
      result = board.diagonal_winner?
      expect(result).to eq true
    end
  end

  context 'When called and the board contains a winning anti-diagonal' do
    it 'returns true' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( - - X
                        - X -
                        X - - )
      result = board.diagonal_winner?
      expect(result).to eq true
    end
  end

  context 'When called and the board does not contain a winning main diagonal' do
    it 'returns false' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( O O O
                        - - -
                        - - - )
      result = board.diagonal_winner?
      expect(result).to eq false
    end
  end

  context 'When called and the board does not contain a winning anti-diagonal' do
    it 'returns false' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( - - -
                        - - -
                        X X X )

      result = board.diagonal_winner?
      expect(result).to eq false
    end
  end
end

describe Board, '#tied?' do

  context 'When called and the board is tied' do
    it 'returns true' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( O X O
                        X X O
                        X O X )

      result = board.tied?
      expect(result).to eq true
    end
  end

  context 'When called and the board is not tied' do
    it 'returns false' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( O X O
                        X X O
                        X X - )

      result = board.tied?
      expect(result).to eq false
    end
  end
end

describe Board, '#any_winner?' do

  context 'When called and the board contains a winning combo' do
    it 'returns true' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( X X X
                        - - -
                        - - - )

      result = board.any_winner?
      expect(result).to eq true
    end
  end

  context 'When called and the board does not contain a winning combo' do
    it 'returns false' do
      board = Board.new(BOARD_SIZE)
      board.cells = %w( O X O
                        X X O
                        X O X )
      result = board.any_winner?
      expect(result).to eq false
    end
  end
end
