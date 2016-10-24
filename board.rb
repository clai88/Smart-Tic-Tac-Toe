require 'pry'
require 'colorize'
class Board
    attr_reader :board
    attr_reader :valid_moves
    def initialize
        @board = Array.new(9, ' ')
    end

    def fill_in_placeholders
        9.times do |i|
            case i
            when 0..2
                @board[i] = "A#{i + 1}"
            when 3..5
                @board[i] = "B#{i - 2}"
            when 6..8
                @board[i] = "C#{i - 5}"
            end
        end
        @valid_moves = @board.map { |x| x }
    end
end

module PrintBoard
    def self.print_board(board)

        system "clear"

        copy_board = board.dup

        copy_board.each_with_index do |i,index|
            if copy_board[index] == "X "
                copy_board[index] = copy_board[index].green
            end
            if copy_board[index] == "O "
                copy_board[index] = copy_board[index].red
            end
        end

        print " #{copy_board[0]} | #{copy_board[1]} | #{copy_board[2]} \n"
        print "-------------\n"
        print " #{copy_board[3]} | #{copy_board[4]} | #{copy_board[5]} \n"
        print "-------------\n"
        print " #{copy_board[6]} | #{copy_board[7]} | #{copy_board[8]} \n"
    end
end
