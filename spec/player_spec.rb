require_relative '../lib/player'

RSpec.describe Player, '#initialize' do
  context 'When the player is initialized' do
    it 'creates a player' do
      symbol = "X"
      player = Player.new(symbol)
      result = player.symbol
      expect(result).to eq("X")
    end
  end
end
