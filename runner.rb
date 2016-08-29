require './tic_tac_toe'
require './tic_tac_toe_computer'
require './board'

puts "Welcome to tic-tac-toe!"
  b = Board.new
  b.fill_in_placeholders
  a = TicTacToeComputer.new(b.board, b.valid_moves)
  a.start
  PrintBoard::print_board(a.board)
  a.make_a_move
