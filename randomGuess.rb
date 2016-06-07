	def GuessRandomNumber
		puts "Guess a number between 1 and 10"
		random_number = rand(1..10)
		while random_number != (guess_number = Integer(gets))
			if Integer(guess) < random_number
				puts "too low \n Please, guess again"
			else
				puts "too high \n Please, guess again"
			end
		end
		puts "Right on, good guess \nBye."
	end
GuessRandomNumber()