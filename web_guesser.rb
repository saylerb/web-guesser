require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

# aasdfasdfasdsaf

get '/' do
  guess = params[:guess].to_i 

  # require "pry"; binding.pry
  if guess == number
    msg = "You guessed the number!"
  elsif guess > number 
    msg = "Too high. Guess again!"
  elsif  guess < number 
    msg  = "Too low. Guess again" 
  else 
    msg = "Didn't hit one of the cases"
  end
  

  erb :index, :locals => {:number => number, :msg => msg}
end

