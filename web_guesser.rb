require 'sinatra'
require 'sinatra/reloader'
require_relative 'game'
require_relative 'input_validator'

game = Game.new

post '/' do
  game.set_lang(params[:lang])
  redirect '/'
end

get '/' do
  @guess = params[:guess]
  validator = InputValidator.new(@guess)
  if validator.valid?
    game.start(@guess)
    @message = game.message
  else
    @message = validator.message
  end

  erb game.lang.to_sym, locals: {
    attempt: game.attempt_number,
    secret: game.secret,
    message_case: game.message_case
  }
end
