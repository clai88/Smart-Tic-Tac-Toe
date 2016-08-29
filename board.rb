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
    print " #{board[0]} | #{board[1]} | #{board[2]} \n"
    print "-------------\n"
    print " #{board[3]} | #{board[4]} | #{board[5]} \n"
    print "-------------\n"
    print " #{board[6]} | #{board[7]} | #{board[8]} \n"
  end
end
