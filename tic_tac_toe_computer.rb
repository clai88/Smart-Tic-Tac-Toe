require './tic_tac_toe'
require 'pry'

# tictactoe computer class
class TicTacToeComputer < TicTacToe
  def start
    puts "Hit enter to play"
    STDIN.gets.chomp
  end

  def make_a_move
    i = 0
    while @board & @valid_moves != []
      if i.even?
        puts "\nMake your move!"
        loop do
          move = STDIN.gets.chomp
          if valid?(move.capitalize)
            index = @valid_moves.index(move.capitalize)
            @board[index] = 'X '
            break
          else
            puts 'Bad move. Please guess again'
          end
        end
      else
        @board[computer_move] = 'O '
        puts 'Computer Moved'
      end
      i += 1
      PrintBoard::print_board(@board)
      break if Won.winner?(@board)
    end

    if Won.winner?(@board)
      puts i.even? ? 'Computer wins
        .---.__
       /  /6|__\
       \  \/--`
       /  \\
      /    )\
     /  _.\' /
    //~`\\-\'
 =====//===(=))========= '
      : "You win."
    else
      puts 'Tie game!'
    end
  end

  def computer_move
    valid_indeces = []
    for i in (0...@board.length)
      unless @board[i] == 'X '
        valid_indeces.push(i) unless @board[i] == 'O '
      end
    end
    valid_indeces.include?(4) ? 4 : smart_move(valid_indeces)
  end

  def smart_move(valid_indeces)
    move = try_to_win(valid_indeces, "O ")
    return move unless move == nil

    move = try_to_win(valid_indeces, "X ")
    return move unless move == nil

    return check_tricky_corner(valid_indeces)
  end

  def try_to_win(available,piece)
    available.each do |i|
      play_board = @board.dup
      play_board[i] = piece
      return i if Won.winner?(play_board)
    end
    nil
  end

  def check_tricky_corner(available)
    if @board[0] == 'X ' && @board[8] ||
       @board[2] == 'X ' && @board[6]
      return ([1, 3, 5, 7] & available).sample
    end
    a = ([0, 2, 6, 8] & available).sample
    return a == [] ? available.sample : a
  end
end
