def guessRandomNumber
	randomNumber = rand(10) + 1
	puts "Guess a number between 1 and 10"
	guess = gets
	if guess == randomNumber
		puts "Right on, good guess"
	elseif guess < randomNumber
		puts "too low"
	else
		puts "too high"
	end
end

guessRandomNumber

puts "bye"
gets