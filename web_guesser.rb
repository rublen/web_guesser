require 'sinatra'
require 'sinatra/reloader'
n = rand(101)
get '/' do
  "The SECRET NUMBER is #{n}"
end
