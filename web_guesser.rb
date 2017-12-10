require 'sinatra'
require 'sinatra/reloader'
require_relative 'game'
require_relative 'input_validator'

EMPTY_INPUT_MESSAGE = { eng: '<br>You need to enter the number',
                        ukr: '<br>Введіть число',
                        ru: '<br>Введите число' }.freeze

WRONG_INPUT_MESSAGE = { eng: 'WRONG INPUT<br> Enter the number from 0 to 100',
                        ukr: 'Введено неправильне значення<br> Введіть число від 0 до 100',
                        ru: 'Введено неправильное значенние<br> Введите число от 0 до 100' }.freeze

game = Game.new

post '/' do
  game.update_lang(params[:lang])
  redirect '/'
end

get '/' do
  validator = InputValidator.new(params[:guess])
  if validator.valid?
    game.start(params[:guess])
    @message = game.message
  else
    @message = validator.message[game.lang.to_sym]
  end

  erb game.lang.to_sym, locals: { attempt: game.attempt_number, secret: game.secret, message_case: game.message_case }
end
