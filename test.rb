require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require './tic_tac_toe'
require './tic_tac_toe_computer'
require './board'
require './won'
require 'pry'

# this is my test
class TicTacToeTest < Minitest::Test
  def test_classes_exist
    assert TicTacToe
    assert TicTacToeComputer
    assert Won
    assert Board
    assert PrintBoard
  end

  def test_empty_board
    a = Board.new
    assert_equal 9, a.board.count(' ')
  end

  def test_non_empty_board
    a = Board.new
    valid_moves = a.fill_in_placeholders
    assert_equal  valid_moves, a.board
  end

  def test_horizontal_win
    a = Board.new
    a.fill_in_placeholders
    assert_equal false, Won::winner?(a.board)
    (3..5).each { |i| a.board[i] = 'X ' }
    assert_equal true, Won::winner?(a.board)
  end

  def test_vertical_win
    a = Board.new
    a.fill_in_placeholders
    assert_equal false, Won::winner?(a.board)
    [2, 5, 8].each { |i| a.board[i] = 'X ' }
    assert_equal true, Won::winner?(a.board)
  end

  def test_diag_win
    a = Board.new
    a.fill_in_placeholders
    assert_equal false, Won::winner?(a.board)
    [8, 4, 0].each { |i| a.board[i] = 'O ' }
    assert_equal true, Won::winner?(a.board)
  end
end
