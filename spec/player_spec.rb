require_relative '../lib/player'

describe Player, '#make_move' do
  context 'When the player is asked' do
    it 'makes a move' do
      symbol = 'X'
      player = Player.new(symbol)
      result = player.make_move
      move = 3
      expect(result).to eq(move)
    end
  end
end
