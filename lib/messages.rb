class Messages

  def pre_render_welcome
    string = ""
    string << "Let's play tic tac toe"

    string
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
    string = ""
    string << "Please select 1, 2 or 3."

    string
  end

  def pre_render_prompt_player_for_move
    string = ""
    string << "Please make your move"

    string
  end

  def pre_render_prompt_select_space
    string = ""
    string << "Please select a valid space on the board."

    string
  end

  def pre_render_cats_game
    string = ""
    string << "Cat's game!!"

    string
  end

  def pre_render_computer_thinking
    string = ""
    string << "The computer is thinking..."
  end

  def pre_render_player_turn(game)
    string = ""
    string = "Its time for #{game.current_player.symbol} to go"
  end

  def pre_render_player_choice(game)
    string = ""
    string = "#{game.current_player.symbol} has chosen"
  end

  def pre_render_player_move(ui)
    string = ""
    string = "Your move is #{ui.move}"
  end

  def pre_render_winner(board, game, board_evaluator)
    string = ""
    string << game.winner(board, board_evaluator)
    string << " has won the game!"

    string
  end

end

