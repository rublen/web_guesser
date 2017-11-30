require 'sinatra'
require 'sinatra/reloader'
require_relative 'game'
require_relative 'input_validator'

# enable :sessions

game = Game.new

post '/' do
	game.set_lang(params['lang'])
	
	redirect "/"
end

get "/" do
	@guess = params[:guess]
	validator = InputValidator.new(@guess)
	if validator.valid?
		game.start(@guess)
		@message = game.getmessage
	else
		@message = validator.message
	end

	p params
	puts "@lang = #{game.lang}"
	erb game.lang.to_sym, :locals => {:secret => game.secret, 
																		:check_guess => game.message_case, 
																		# :message => game.getmessage, 
																		:attempt => game.attempt_number
																	 }
end


