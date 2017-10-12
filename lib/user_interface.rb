class UserInterface

  attr_reader :game_type, :move

  def initialize(validator, print = lambda {|s| puts s}, prompt = lambda {|| gets.chomp})
    @validator = validator
    @print = print
    @prompt = prompt
  end

  def draw_board(board)
    @print.call pre_render_board(board)
  end

  def draw_board_map
    @print.call pre_render_board_map
  end

  def welcome
    @print.call pre_render_welcome
  end

  def prompt_user_for_game_type
    @print.call pre_render_game_type
  end

  def get_game_type
    @game_type = @prompt.call

    until (@validator.valid_game?(@game_type.to_i))
      @print.call pre_render_select_game_type
      @game_type = @prompt.call
    end
  end

  def prompt_player_for_move(board)
    @print.call pre_render_prompt_player_for_move
    @move = @prompt.call

    until (@validator.valid_move?(board, input_to_int(@move)))
      @print.call pre_render_prompt_select_space
      @move = @prompt.call
    end
  end

  def show_winner(board, game, board_evaluator)
    if board_evaluator.tied?(board)
      @print.call pre_render_cats_game
    else
      @print.call pre_render_winner(board, game, board_evaluator)
    end
  end

  private

  def pre_render_board(board)
    string = ""

    string << board.get_cell(0) + " | " + board.get_cell(1) + " | " + board.get_cell(2) + "\n"
    string << "---------" + "\n"
    string << board.get_cell(3) + " | " + board.get_cell(4) + " | " + board.get_cell(5) + "\n"
    string << "---------" + "\n"
    string << board.get_cell(6) + " | " + board.get_cell(7) + " | " + board.get_cell(8) + "\n"

    string
  end

  def pre_render_board_map
    string = ""

    string << "0 | 1 | 2" + "\n"
    string << "---------" + "\n"
    string << "3 | 4 | 5" + "\n"
    string << "---------" + "\n"
    string << "6 | 7 | 8" + "\n"

    string
  end

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

  def pre_render_winner(board, game, board_evaluator)
    string = ""
    string << game.winner(board, board_evaluator)
    string << " has won the game!"

    string
  end

  def input_to_int(string)
    number = string.to_i
    number if number.to_s == string
  end

end
