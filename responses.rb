module Responses
  
  def self.very_low
    "Way too low! Guess again"
  end

  def self.low
    "Too low, Guess again!"
  end

  def self.very_high
    "Way too high! Guess again"
  end

  def self.high
    "Too high, Guess again!"
  end

  def self.win_game(secret_number)
    "You guessed the number!"+"<br>"+"The secret number was #{secret_number}."
  end

  def self.debug_mode(previous_guess, secret_number, remaining_guesses)
    "DEBUG MOE:" + "<br>" + "The secret number is #{secret_number}." + 
    "<br>" + generate_previous_guess_msg(previous_guess) +
    "<br>" + "Remaining guesses: #{remaining_guesses}."
  end
  
  def self.normal_mode(previous_guess, secret_number, remaining_guesses)
    "Your previous guess was #{previous_guess}." +
    "<br>" + generate_previous_guess_msg(previous_guess) +
    "<br>" + "Remaining guesses: #{remaining_guesses}."
  end

  def self.generate_previous_guess_msg(previous_guess)
    if previous_guess.nil?
      "Please guess a number! You have 5 guesses left."
    else
      "<br>" + "Previous guess is #{previous_guess}."
    end
  end

end


