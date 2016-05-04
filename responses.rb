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

end

