require 'sinatra'
require 'sinatra/reloader'
require_relative 'responses'

set :secret, rand(100)
disable :debug_mode
@@total_guesses = 0
previous_guess ||= nil

get '/' do
  guess = params[:guess].to_i 
  msg, background_color = check_guess(guess, settings.secret)

  check_total_guesses(previous_guess, guess)
  previous_guess = guess

  debug_msg = generate_debug(previous_guess, guess, settings.secret)
  erb :index, :locals => {:msg => msg, :debug_msg => debug_msg,
                          :background_color => background_color}   # :number => number
end

def check_total_guesses(previous_guess, guess)
  @@total_guesses += 1 unless guess == previous_guess
  if @@total_guesses == 5
    settings.secret = rand(100)
    @@total_guesses = 0
  end
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

def generate_debug(previous_guess, guess, number)
  if settings.debug_mode
    "DEBUG MODE:" + "<br>" + "The secret number is #{number}." +
    "<br>" + "Previous guess is #{previous_guess}." +
    "<br>" + "Total guesses: #{@@total_guesses}."
  else
    "Your previous guess was #{previous_guess}." +
    "<br>" + "Total guesses: #{@@total_guesses}."
  end
end
