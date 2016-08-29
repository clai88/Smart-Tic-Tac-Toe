require 'pry'
require './won'

class TicTacToe
  attr_reader :board
  def initialize(board, valid_moves)
    @board = board
    @valid_moves = valid_moves
  end

  def make_a_move
    i = 0
    while @board & @valid_moves != []
      player = i.even? ? @p1 : @p2
      puts "\nPlayer #{player}! Make your move!"

      loop do
        move = gets.chomp
        if valid?(move.capitalize)
          index = @valid_moves.index(move.capitalize)
          @board[index] = player == @p1 ? 'X ' : 'O '
          break
        else
          puts 'Bad move. Please guess again'
        end
      end
      i += 1
      PrintBoard::print_board(@board)
      break if Won.winner?(@board)
    end
    if Won.winner?(@board)
      puts i.even? ? "#{@p2} wins" : "#{@p1} wins."
    else
      puts 'Tie game!'
    end
  end

  def valid?(move)
    @valid_moves.index(move.capitalize) && @board.include?(move)
  end

  def start
    puts "Welcome! Let's play tic tac toe"
    puts 'Player 1. Enter your name.'
    @p1 = gets.chomp
    puts 'Player 2. Enter your name.'
    @p2 = gets.chomp
  end
end
