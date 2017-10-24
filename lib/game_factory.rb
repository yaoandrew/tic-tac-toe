require_relative '../lib/human_player'
require_relative '../lib/computer_player'
require_relative '../lib/game'

class GameFactory

  def create_game(game_type)
    case game_type
    when 1
      player1 = HumanPlayer.new('X')
      player2 = HumanPlayer.new('O')
      game = Game.new(player1, player2)
    when 2
      player1 = HumanPlayer.new('X')
      player2 = ComputerPlayer.new('O')
      game = Game.new(player1, player2)
    when 3
      player1 = ComputerPlayer.new('X')
      player2 = ComputerPlayer.new('O')
      game = Game.new(player1, player2)
    end
  end

end
