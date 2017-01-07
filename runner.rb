require './tic_tac_toe'
require './tic_tac_toe_computer'
require './board'

puts "Welcome to tic-tac-toe!"
# puts "player mode selected" if ARGV == "-t"

# binding.pry
if ARGV[0] == "-t"
    puts "two player mode selected"
    b = Board.new
    b.fill_in_placeholders
    a = TicTacToe.new(b.board, b.valid_moves)
    a.start
    PrintBoard::print_board(a.board)
    a.make_a_move

else

    b = Board.new
    b.fill_in_placeholders
    a = TicTacToeComputer.new(b.board, b.valid_moves)
    a.start
    PrintBoard::print_board(a.board)
    a.make_a_move

end
