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
		require_relative "#{@lang}.rb"
	end

	def check_guess
		@secret_number.check @guess
	end

	def set_lang(lang)
		if lang
			@lang = lang
			require_relative "#{@lang}.rb"
			@message = MESSAGES[check_guess] if check_guess
		end
	end

	def start(guess)		
		@guess = guess
		message_case = check_guess
		if message_case
			@message = MESSAGES[message_case]
			@counter -= 1
		end
		reset if over?
	end

	def attempt_number
		6 - @counter
	end

	def secret
		@secret_number.secret
	end

	def getmessage
		@message
	end
	

	private

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