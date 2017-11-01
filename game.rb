require_relative 'secret_number.rb'

class Game
	START_MESSAGE = "<br><br>New Secret Number has been generated. <br><br>You have new 5 attempts"

	attr_accessor :message

	def initialize
		@secret_number = SecretNumber.new
		@guess = 0
		@message = ''
		@counter = 6
	end

	def reset
		@secret_number = SecretNumber.new
		@guess = 0
		@message += START_MESSAGE
		@counter = 5
	end

	def check_guess
		@message = @secret_number.check_guess(@guess)
	end

	def over?
		@counter == 0 or @secret_number.equal?(@guess)
	end

	def start(guess)
		@guess = guess
		check_guess		
		@counter -= 1
		reset if over?
	end

	def attempt_number
		6 - @counter
	end

	def secret
		@secret_number.secret
	end

end