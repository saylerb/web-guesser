require 'sinatra'
require 'sinatra/reloader'

set :secret, rand(100)
disable :debug_mode

get '/' do
  guess = params[:guess].to_i 
  msg = check_guess(guess, settings.secret)
  debug_msg = generate_debug(settings.secret)
  erb :index, :locals => {:msg => msg, :debug_msg => debug_msg}   # :number => number
end

def check_guess(guess, number)
  if guess > number 
    guess - number > 5 ? "Way too high! Guess again" : "Too high. Guess again!"
  elsif guess < number 
    number - guess > 5 ? "Way too low! Guess again" : "Too low. Guess again"
  else
    "You guessed the number!\nThe secret number was #{number}."
  end
end

def generate_debug(number)
  settings.debug_mode ? "DEBUG MODE: The Secret Number is #{number}." : ""
end
