require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board.rb'

describe Game, '#new_game' do

  context 'When a game starts' do
    it 'Should take two players and a board as args' do
      player1 = Player.new('X', :human, 1)
      player2 = Player.new('O', :computer, 2)
      board = Board.new(3)
      game = Game.new(player1, player2, board)
      expect(game.board).to eq board
    end
    it 'Should determine the first player' do
      player1 = Player.new('X', :human, 2)
      player2 = Player.new('O', :computer, 1)
      board = Board.new(3)
      game = Game.new(player1, player2, board)
      expect(game.first_player).to eq player2
    end
  end
end

describe Game, '#game_over?' do
  context 'When there is a winner' do
    it 'Should return true' do
      player1 = Player.new('X', :human, 1)
      player2 = Player.new('O', :computer, 2)
      board = Board.new(3)
      game = Game.new(player1, player2, board)
      board.mark_cell(0, 'X')
      board.mark_cell(1, 'X')
      board.mark_cell(2, 'X')
      expect(game.game_over?).to be true
    end
  end

  context 'Where there is a tie' do
    it 'Should return true' do
      player1 = Player.new('X', :human, 1)
      player2 = Player.new('O', :computer, 2)
      board = Board.new(3)
      game = Game.new(player1, player2, board)
      board.mark_cell(0, 'O')
      board.mark_cell(1, 'X')
      board.mark_cell(2, 'O')
      board.mark_cell(3, 'X')
      board.mark_cell(4, 'X')
      board.mark_cell(5, 'O')
      board.mark_cell(6, 'X')
      board.mark_cell(7, 'O')
      board.mark_cell(8, 'X')
      expect(game.game_over?).to be true
    end
  end

  context 'Where there is no tie and no winner' do
    it 'Should return false' do
      player1 = Player.new('X', :human, 1)
      player2 = Player.new('O', :computer, 2)
      board = Board.new(3)
      game = Game.new(player1, player2, board)
      board.mark_cell(0, 'O')
      board.mark_cell(1, 'X')
      board.mark_cell(2, 'O')
      expect(game.game_over?).to be false
    end
  end
end
