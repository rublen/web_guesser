require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(guess)
	diff = SECRET_NUMBER - 5
	case guess
	when SECRET_NUMBER 
		message = 'BINGO!'
	when 0...diff
		message = 'Way Too LOW!'
	when diff...SECRET_NUMBER 
		message = 'Too LOW!'
	when SECRET_NUMBER+1...diff+10
		message = 'Too HIGH!'
	else
		message = 'Way Too HIGH!'
	end
	message
end

get '/' do
	guess = params['guess'].to_i
	message = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER, :message => message }
  # throw params.inspect  
end
