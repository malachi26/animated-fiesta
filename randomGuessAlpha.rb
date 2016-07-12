
$randomNumber = rand(10) + 1

def guessRandomNumber
  puts "Guess a number between 1 and 10"
  guess = gets
  if Integer(guess) == $randomNumber
    puts "Right on, good guess"
    elsif Integer(guess) < $randomNumber
    puts "too low"
    puts "please, guess again"
    guessRandomNumber
    elsif Integer(guess) > $randomNumber
    puts "too high"
    puts "please, guess again"
    guessRandomNumber
  else
    puts "is that even a number? please, guess again"
    guessRandomNumber
  end
end

guessRandomNumber

puts "bye"
gets5