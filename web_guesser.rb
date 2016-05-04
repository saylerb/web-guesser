require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params[:guess].to_i 
  msg = check_guess(guess, number)
  erb :index, :locals => {:number => number, :msg => msg}
end

def check_guess(guess, number)
  if guess == number
    "You guessed the number!\nThe secret number was #{number}."
  elsif guess > number 
    if guess - number > 5
      "Way too high! Guess again"
    else
      "Too high. Guess again!"
    end
  elsif guess < number 
    if number - guess > 5 
      "Way too low! Guess again"
    else
      "Too low. Guess again" 
    end
  else
    "Didn't hit one of the cases"
  end
end

