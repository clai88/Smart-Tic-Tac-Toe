module Won
  POSSIBLE_SOLUTIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def self.winner?(board)
    x = ["X ", "X ", "X "]
    o = ["O ", "O ", "O "]
    POSSIBLE_SOLUTIONS.each do |sol|
      solution = board.values_at(sol[0], sol[1], sol[2])
      return true if solution == x || solution == o
    end
    false
  end
end
