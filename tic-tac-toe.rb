playingBoard = [[1,2,3], [4,5,6], [7,8,9]]

def printBoard(playingBoard)
  for i in 0...3
    for j in 0...3
      print "[#{playingBoard[i][j]}] "
    end
    print"\n"
  end
end

printBoard(playingBoard)