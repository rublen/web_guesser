require 'sinatra'
require 'sinatra/reloader'
require_relative 'game.rb'

enable :sessions

game = Game.new

post '/' do
	game.set_lang(params['lang'])
	# game.lang = params['lang']
	redirect "/"
end

get "/" do
	game.start(params['guess'])
	p params
	puts "@lang = #{game.lang}"
	erb game.lang.to_sym, :locals => {:secret => game.secret, 
																		:check_guess => game.check_guess, 
																		:message => game.message, 
																		:attempt => game.attempt_number
																	 }
end


