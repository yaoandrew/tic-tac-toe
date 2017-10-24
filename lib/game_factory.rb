require_relative '../lib/player'
require_relative '../lib/computer'
require_relative '../lib/game'

class GameFactory

  def create_game(game_type)
    case game_type
    when 1
      player1 = Player.new('X')
      player2 = Player.new('O')
      game = Game.new(player1, player2)
    when 2
      player1 = Player.new('X')
      player2 = Computer.new('O')
      game = Game.new(player1, player2)
    when 3
      player1 = Computer.new('X')
      player2 = Computer.new('O')
      game = Game.new(player1, player2)
    end
  end

end
