require_relative '../lib/game_factory'
require_relative '../lib/player'

describe GameFactory, '#create_game' do
      game_factory = GameFactory.new

  context 'When called with game_type 1' do
    it 'returns a game where Player1 is a human player' do
      result = game_factory.create_game(1)

      expect(result.player1.is_a?(Player)).to be true
    end
  end

  context 'When called with game_type 1' do
    it 'returns a game where Player2 is a human player' do
      result = game_factory.create_game(1)

      expect(result.player2.is_a?(Player)).to be true
    end
  end

  context 'When called with game_type 2' do
    it 'returns a game where Player1 is a human player' do
      result = game_factory.create_game(2)

      expect(result.player1.is_a?(Player)).to be true
    end
  end

  context 'When called with game_type 2' do
    it 'returns a game where Player2 is a computer player' do
      result = game_factory.create_game(2)

      expect(result.player2.is_a?(Computer)).to be true
    end
  end

  context 'When called with game_type 3' do
    it 'returns a game where Player1 is a computer player' do
      result = game_factory.create_game(3)

      expect(result.player1.is_a?(Computer)).to be true
    end
  end

  context 'When called with game_type 3' do
    it 'returns a game where Player2 is a computer player' do
      result = game_factory.create_game(3)

      expect(result.player2.is_a?(Computer)).to be true
    end
  end
end
