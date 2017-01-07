require './tic_tac_toe'
require './tic_tac_toe_computer'
require './board'
require 'colorize'


# puts "player mode selected" if ARGV == "-t"

# binding.pry
if ARGV[0] == '-t'
    puts "Welcome to tic-tac-toe!"
    puts "two player mode selected"
    b = Board.new
    b.fill_in_placeholders
    a = TicTacToe.new(b.board, b.valid_moves)
    a.start
    PrintBoard::print_board(a.board)
    a.make_a_move

elsif ARGV[0] == '-h' || ARGV[0] == '--help'
    x = "X".green
    o = "O".red
    h = "-h".red
    help = "--help".red
    t = "-t".red

    puts "NAME".red
    puts "\tTicTacToe"
    puts "DESCRIPTION".red
    puts "\tThe game takes place on a 3x3 grid.\n\tTwo players take turns attempting to match\n\tthree of their respective pieces (#{x} or #{o})\n\tinto a straight line. If all spaces are\n\tfilled and no one has won, the game is a tie.\n"

    puts "\n\tThe following options are available"
    puts "\t#{h} or #{help}\tshows the intruction\n\t\t\tpage"
    puts "\n\t#{t}\t\tenables two player mode (default\n\t\t\tis against a computer)"

    # puts "\nTux\t\t   November 2, 1996\t\t   Tux"


else
    puts "Welcome to tic-tac-toe!"
    b = Board.new
    b.fill_in_placeholders
    a = TicTacToeComputer.new(b.board, b.valid_moves)
    a.start
    PrintBoard::print_board(a.board)
    a.make_a_move

end
