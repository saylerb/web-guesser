require 'sinatra'
require 'sinatra/reloader'
require_relative 'responses'

set :secret, rand(100)
disable :debug_mode
@@remaining_guesses = 5
previous_guess ||= nil

get '/' do
  guess = get_guess(params[:guess])
  msg, background_color = check_guess(guess, settings.secret) if !guess.nil?
  check_total_guesses(previous_guess, guess)
  previous_guess = guess

  debug_msg = generate_debug(previous_guess, guess, settings.secret)
  erb :index, :locals => {:msg => msg, :debug_msg => debug_msg,
                          :background_color => background_color}   # :number => number
end

def get_guess(input)
  if input.nil? || input == ""
    return nil
  else
    return input.to_i
  end
end

def check_total_guesses(previous_guess, guess)
  @@remaining_guesses -= 1 unless guess == previous_guess
  if @@remaining_guesses == 0
    settings.secret = rand(100)
    @@remaining_guesses = 5
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
    Responses.debug_mode(previous_guess, number, @@remaining_guesses)
  else
    Responses.normal_mode(previous_guess, number, @@remaining_guesses)
  end
end
