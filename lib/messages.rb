class Messages

  def pre_render_welcome
    "Let's play tic tac toe"
  end

  def pre_render_game_type
    string = ""
    string << "Please choose a game type:" + "\n"
    string << "1) Human vs. Human" + "\n"
    string << "2) Human vs. Computer" + "\n"
    string << "3) Computer vs. Computer"

    string
  end

  def pre_render_select_game_type
    "Please select 1, 2 or 3."
  end

  def pre_render_prompt_player_for_move
    "Please make your move"
  end

  def pre_render_prompt_select_space
    "Please select a valid space on the board."
  end

  def pre_render_cats_game
    "Cat's game!!"
  end

  def pre_render_computer_thinking
    "The computer is thinking..."
  end

  def pre_render_player_turn(game)
    "Its time for #{game.current_player.symbol} to go"
  end

  def pre_render_player_choice(game)
    "#{game.current_player.symbol} has chosen"
  end

  def pre_render_player_move(move)
    "Your move is #{move}"
  end

  def pre_render_winner(board, game, board_evaluator)
    "#{game.winner(board, board_evaluator)} has won the game!"
  end

end

