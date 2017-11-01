require 'sinatra'
require 'sinatra/reloader'
require_relative 'game.rb'

game = Game.new
get '/' do
	game.start(params['guess'].to_i)
	erb :index, :locals => { :message => game.message, :attempt => game.attempt_number}
end
