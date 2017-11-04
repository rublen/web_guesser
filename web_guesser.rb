require 'sinatra'
require 'sinatra/reloader'
require_relative 'game.rb'

game = Game.new

get '/' do
	game.start(params['guess'], params['lang'])
	# p params
	erb game.lang.to_sym, :locals => {:secret => game.secret, 
																		:check_guess => game.check_guess, 
																		:message => game.message, 
																		:attempt => game.attempt_number
																	 }
end


