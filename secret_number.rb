class SecretNumber
	N = 101
	DEVIATION = 5
		
	def initialize
		@value = rand(N)
	end

	def check(guess)
		guess = guess.to_i
		diff = @value - DEVIATION
		case guess
			when @value then 0 # "BINGO!"
			when @value+1...diff+DEVIATION*2+1 then 1 #"Too HIGH!"			
			when diff...@value then 2 # "Too LOW!"
			when 0...diff then 3 # "Way too LOW!"	
		else 4 # "Way too HIGH!"
		end
	end

	def equal?(guess)
		@value == guess.to_i
	end

	def secret
		@value
	end

end