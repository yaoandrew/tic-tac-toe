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

  def prompt_user_to_choose_mark
    puts "Please select X or O"
    @mark = gets.chomp
  end

  def prompt_user_to_choose_order
    puts "Do you want to go first (y/n)?"
    @order = gets.chomp
  end

  def prompt_player_move
    puts "Please make your move"
    @move = gets.chomp
  end
end
