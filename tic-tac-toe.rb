def printBoard(playingBoard)
  for i in 0...3
    for j in 0...3
      print "[ #{playingBoard[i][j]} ] "
    end
    print"\n"
  end
  print "\n"
end

def getInput                                           #scans for input, checks if it fits number range
  selection = nil
  loop do
    selection = gets.chomp.to_i
    break if(selection >= 0 && selection <= 8)
    print "Input must be [0,8], please try again: "
  end
  return selection
end

def isWin(playerName, playingBoard)
  for i in 0...3
    if (playingBoard[i][0] == playingBoard[i][1] &&  playingBoard[i][1] == playingBoard[i][2] && playingBoard[i][0] == playerName)
      return true
    elsif (playingBoard[0][i] == playingBoard[1][i] &&  playingBoard[1][i] == playingBoard[2][i] && playingBoard[0][i] == playerName)
      return true
    end

    if (playingBoard[0][0] == playingBoard[1][1] &&  playingBoard[1][1] == playingBoard[2][2] && playingBoard[0][0] == playerName)
      return true
    elsif (playingBoard[2][0] == playingBoard[1][1] &&  playingBoard[1][1] == playingBoard[2][0] && playingBoard[2][0] == playerName)
      return true
    end                 #short enough for me to be too lazy to bother with loops
  end
  return false
end

def isValid(selection, playingBoard)                  #checks if the chosen field isn't already occupied
  if selection == nil
    print "ERR: can't get selection"
    exit(1)
  end

  i = selection / 3
  j = selection % 3

  if playingBoard[i][j].is_a?(Integer)
    return true
  else
    return false
  end
end

def addMove(selection, playerName, playingBoard)      #adds players mark to chosen field
  i = selection / 3
  j = selection % 3
  playingBoard[i][j] = playerName
  puts "Set '#{playerName}' to #{selection}"
end

def playerTurn(playerName, playingBoard)              #main function
  printBoard(playingBoard)
  print "Player '#{playerName}' turn.\nWhere do you want to put an '#{playerName}'? [1-9]: "

  selection = nil
  loop do
    selection = getInput
    break if(isValid(selection, playingBoard))
    print "Field taken, try a different one: "
  end

  addMove(selection, playerName, playingBoard)

  if isWin(playerName, playingBoard)
    puts "Congratulations! Player '#{playerName}' wins!"
    exit(1)
  else
    return
  end
end

n = 0                                                     #intializing necessary variables
playingBoard = [[0,1,2], [3,4,5], [6,7,8]]
playerName = ['O', 'X']

loop do                                                   #switches between 'O' and 'X' until the board is full
  playerTurn(playerName[n % 2], playingBoard)
  n += 1
  if n > 8
    print"Draw!"
    exit(1)
  end
end