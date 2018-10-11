number = rand(100);
guess = nil

puts "Welcome to the guessing game!"

while guess != number do
  print "Enter your guess: "
  guess = gets.to_i

  print "Your guess of #{guess} "

  if guess > number
    print "is too high"
  elsif guess < number
    print "is too low"
  else
    print "is goddamn right! Congrats motherfucker!"
  end

  print "\n"
end
