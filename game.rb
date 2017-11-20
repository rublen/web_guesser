require_relative 'secret_number.rb'

class Game
	LANGUAGES = ['eng', 'ukr', 'ru']

	attr_reader :message
	attr_accessor :lang

	def initialize
		@secret_number = SecretNumber.new
		@guess = '0'
		@message = ''
		@counter = 5
		@lang = LANGUAGES[0]
	end

	def check_guess
		@secret_number.check @guess
	end

	def set_lang(lang)
		@lang = lang if lang
	end

	def start(guess)
		check_lang	
		@guess = guess
		message_case = check_guess
		if message_case			
			@message = MESSAGES[message_case]
			@counter -= 1
			reset if over?
		else
			@message = WRONG_INPUT_MESSAGE if @counter != 5
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
			require_relative @lang+'.rb'
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