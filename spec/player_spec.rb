require_relative '../lib/player'

describe Player, '#make_move' do
  context 'When the player is asked' do
    it 'makes a move' do
      symbol = 'X'
      type = :human
      order = 1
      player = Player.new(symbol, type, order)
      result = player.make_move
      move = 3
      expect(result).to eq(move)
    end
  end
end
