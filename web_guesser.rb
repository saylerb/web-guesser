require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params[:guess].to_i 

  # require "pry"; binding.pry
  if guess == number
    msg = "You guessed the number!\nThe secret number was #{number}"
  elsif guess > number 
    if guess - number > 5
      msg = "Way too high! Guess again"
    else
      msg = "Too high. Guess again!"
    end
  elsif  guess < number 
    if number - guess > 5 
      msg = "Way too low! Guess again"
    else
      msg  = "Too low. Guess again" 
    end
  else 
    msg = "Didn't hit one of the cases"
  end

  erb :index, :locals => {:number => number, :msg => msg}
end

