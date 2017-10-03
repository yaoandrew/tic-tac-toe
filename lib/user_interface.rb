class UserInterface

  attr_reader :mark, :move, :game_type

  def initialize(validator)
    @validator = validator
  end

  def draw_board(board)
    puts board.display_cell(0) + " | " + board.display_cell(1) + " | " + board.display_cell(2)
    puts "---------"
    puts board.display_cell(3) + " | " + board.display_cell(4) + " | " + board.display_cell(5)
    puts "---------"
    puts board.display_cell(6) + " | " + board.display_cell(7) + " | " + board.display_cell(8)
  end

  def draw_board_map
    puts "Choose your move by picking the number that corresponds with the space you want."
    puts "0 | 1 | 2"
    puts "---------"
    puts "3 | 4 | 5"
    puts "---------"
    puts "6 | 7 | 8"
  end

  def welcome
    puts "Let's play tic tac toe"
  end

  def prompt_user_for_game_type
    puts "Please choose a game type:"
    puts "1) Human vs. Human"
    puts "2) Human vs. Computer"
    puts "3) Computer vs. Computer"
    @game_type = gets.chomp

    until (@validator.valid_game?(@game_type.to_i))
      puts "Please select 1, 2 or 3."
      @game_type = gets.chomp
    end
  end

  def prompt_player_for_move(board)
    puts "Please make your move"
    @move = gets.chomp

    until (@validator.valid_move?(board, input_to_int(@move)))
      puts "Please select a valid space on the board."
      @move = gets.chomp
    end
  end

  def input_to_int(string)
    number = string.to_i
    number if number.to_s == string
  end

  def show_winner(board, game)
    if board.tied?
      puts "Cat's game!!"
    else
      puts "#{game.winner(board)} has won the game!"
    end
  end

end
