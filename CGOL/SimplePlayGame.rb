
def PlayGame
  gameBoard = Board.new([[1, 1], [0, 1], [0, 2]], 5, 5)
  gameBoard.print_board()
  gameBoard.evolve
end

PlayGame()