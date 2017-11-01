class SecretNumber
	
	def initialize
		@value = rand(100)
	end

def check_guess(guess)
		diff = @value - 5
		case guess
		when @value 
			"BINGO!"
		when 0...diff
			"Way too LOW!"
		when diff...@value
			"Too LOW!"
		when @value+1...diff+11
			"Too HIGH!"
		else
			"Way too HIGH!"
		end
	end

	def equal?(guess)
		@value == guess
	end

	# def secret
	# 	@value
	# end
	
end