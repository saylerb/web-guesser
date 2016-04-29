require 'sinatra'
require 'sinatra/reloader'

get '/' do
  #"Hello, World!"
  "THE NUMBER is #{rand(100)}"
end
