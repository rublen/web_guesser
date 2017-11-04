require_relative 'secret_number.rb'

class Game
	LANGUAGES = ['eng', 'ukr', 'ru']

	attr_reader :message, :lang

	def initialize
		@secret_number = SecretNumber.new
		@guess = 0
		@message = ''
		@counter = 5
		@lang = LANGUAGES[1]
	end

	def check_guess
		@secret_number.check @guess
	end

	def start(guess, lang)
		# @lang = lang
		check_lang
		@guess = guess
		if check_guess			
			@message = MESSAGES[check_guess]
			@counter -= 1
			reset if over?
		else
			@message = WRONG_INPUT_MESSAGE
		end
	end

	def attempt_number
		6 - @counter
	end

	def secret
		@secret_number.secret
	end
	

	private

		def check_lang
			case @lang
				when 'eng' then require_relative 'eng.rb'
				when 'ukr' then require_relative 'ukr.rb'
				when 'ru'  then require_relative 'ru.rb'
			end
		end

		def over?
			@counter == 0 or @secret_number.equal? @guess
		end

		def reset
			@secret_number = SecretNumber.new
			@guess = 0
			@message += START_MESSAGE
			@counter = 5
		end

end