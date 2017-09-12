class Computer

  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_simple_move(board)
    simple_move = rand(0..8)
    until board.cell_open?(move)
      simple_move = rand(0..8)
    end
    simple_move
  end

  def make_smart_move(board, depth=0, best_score={})
    return 0 if board.tied?
    return -1 if board.tied? || board.any_winner?

    board.empty_cells.each do |cell|
      board.mark_cell(cell, board.toggle_player_turn)
      best_score[cell] = -1 * make_smart_move(board, depth+1, {})
      board.empty_cells[cell] = cell.to_i


      draw_board(board)

    end

    5




    #return 0 if board.tied?
    #return -1 if board.tied? || board.any_winner?

    #board.empty_cells.each do |cell|
      #board.mark_cell(cell, board.toggle_player_turn)

      #best_score[cell] = -1 * make_smart_move(board, depth+1, {})
      #board.empty_cells[cell] = cell.to_i
    #end

    #smart_move = best_score.max_by { |key, value| value }[0]
    #high_minimax_score = best_score.max_by { |key, value| value }[1]

    #if depth == 0
      #return smart_move
    #elsif depth > 0
      #return high_minimax_score
    #end
  end

  def draw_board(board)
    puts "=========="
    puts "=========="
    puts board.display_cell(0) + " | " + board.display_cell(1) + " | " + board.display_cell(2)
    puts "---------"
    puts board.display_cell(3) + " | " + board.display_cell(4) + " | " + board.display_cell(5)
    puts "---------"
    puts board.display_cell(6) + " | " + board.display_cell(7) + " | " + board.display_cell(8)
  end

end
