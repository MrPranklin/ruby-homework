def print_board(playing_board)
  for i in 0...3
    for j in 0...3
      print "[ #{playing_board[i][j]} ] "
    end
    print"\n"
  end
  print "\n"
end

def get_input #scans for input, checks if it is a number and if it fits number range
  loop do
    selection = Integer(gets) rescue false
    if selection && selection >= 0 && selection <= 8
        return selection
    else
      print "Input must be a number [0,8], please try again: "
    end
  end
end

def is_win(player_name, playing_board)
  for i in 0...3
    if (playing_board[i][0] == playing_board[i][1] &&  playing_board[i][1] == playing_board[i][2] && playing_board[i][0] == player_name)
      return true
    elsif (playing_board[0][i] == playing_board[1][i] &&  playing_board[1][i] == playing_board[2][i] && playing_board[0][i] == player_name)
      return true
    end

    if (playing_board[0][0] == playing_board[1][1] &&  playing_board[1][1] == playing_board[2][2] && playing_board[0][0] == player_name)
      return true
    elsif (playing_board[2][0] == playing_board[1][1] &&  playing_board[1][1] == playing_board[2][0] && playing_board[2][0] == player_name)
      return true
    end                 #short enough for me to be too lazy to bother with loops
  end
  return false
end

def is_valid(selection, playing_board)                  #checks if the chosen field isn't already occupied
  i = selection / 3
  j = selection % 3

  if playing_board[i][j].is_a?(Integer)
    return true
  else
    return false
  end
end

def add_move(selection, player_name, playing_board)      #adds players mark to chosen field
  i = selection / 3
  j = selection % 3
  playing_board[i][j] = player_name
  puts "Set '#{player_name}' to #{selection}"
end

def player_turn(player_name, playing_board)              #main function
  print_board(playing_board)
  print "Player '#{player_name}' turn.\nWhere do you want to put an '#{player_name}'? [1-9]: "

  selection = nil
  loop do
    selection = get_input
    break if(is_valid(selection, playing_board))
    print "Field taken, try a different one: "
  end

  add_move(selection, player_name, playing_board)

  if is_win(player_name, playing_board)
    puts "Congratulations! Player '#{player_name}' wins!"
    exit(1)
  else
    return
  end
end

n = 0                                                     #intializing necessary variables
playing_board = [[0,1,2], [3,4,5], [6,7,8]]
player_name = ['O', 'X']

loop do                                                   #switches between 'O' and 'X' until the board is full
  player_turn(player_name[n%2], playing_board)
  n += 1
  if n > 8
    print"Draw!"
    exit(1)
  end
end