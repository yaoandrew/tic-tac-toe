require_relative '../lib/human_player'

describe HumanPlayer, '#make_move' do

  context 'When the player is asked' do
    it 'prompts the human for a move' do
      symbol = 'X'
      type = :human
      order = 1
      human_player = HumanPlayer.new(symbol, type, order)
      result = human_player.make_move
      move = 3
      expect(result).to eq(move)
    end
  end
end
