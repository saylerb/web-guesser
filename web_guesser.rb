require 'sinatra'
require 'sinatra/reloader'
require_relative 'responses'

set :secret, rand(100)
enable :debug_mode

get '/' do
  guess = params[:guess].to_i 
  msg, background_color = check_guess(guess, settings.secret)
  debug_msg = generate_debug(guess, settings.secret)
  erb :index, :locals => {:msg => msg, :debug_msg => debug_msg,
                          :background_color => background_color}   # :number => number
end

def check_guess(guess, number)
  if guess > number 
    if guess - number > 5
      [Responses.very_high, "FireBrick"]
    else
      [Responses.high, "IndianRed"]
    end
  elsif guess < number 
    if number - guess > 5 
      [Responses.very_low, "FireBrick"]
    else
      [Responses.low, "IndianRed"]
    end
  else
    [Responses.win_game(number), "LimeGreen"]
  end
end

def generate_debug(guess, number)
  if settings.debug_mode
    "DEBUG MODE:" + "<br>" + "The secret number is #{number}." +
    "<br>" + "Previous guess is #{guess}." 
  end
end
