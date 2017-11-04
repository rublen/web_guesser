class SecretNumber
	N = 100
	DEVIATION = 5
		
	def initialize
		@value = rand(N)
	end

	def check(guess)
		return false unless valid? guess
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


	private

		def valid?(guess)
			if /^[0-9]{1,3}$/ === guess
			 	guess.to_i <= 100
			else
			 	false
			end
		end

end