class UserInterface

  attr_reader :mark, :order, :move

  def draw_board(board)
    puts board.display_cell(0) + " | " + board.display_cell(1) + " | " + board.display_cell(2)
    puts "---------"
    puts board.display_cell(3) + " | " + board.display_cell(4) + " | " + board.display_cell(5)
    puts "---------"
    puts board.display_cell(6) + " | " + board.display_cell(7) + " | " + board.display_cell(8)
  end

  def draw_board_map
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
  end

  def prompt_user_for_mark
    puts "Please select X or O"
    @mark = gets.chomp
  end

  def prompt_user_for_order
    puts "Do you want to go first (y/n)?"
    @order = gets.chomp
  end

  def prompt_player_for_move
    puts "Please make your move"
    @move = gets.chomp
  end

  def show_winner(board, game)
    if board.tied?
      puts "Cat's game!!"
    else
      puts "#{game.winner} has won the game!"
    end
  end
end
