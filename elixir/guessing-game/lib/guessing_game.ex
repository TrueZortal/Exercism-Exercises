defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess) when guess == :no_guess, do: "Make a guess"
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when secret_number in [guess+1, guess-1], do: "So close"
  def compare(secret_number, guess) when secret_number < guess, do: "Too high"
  def compare(secret_number, guess) when secret_number > guess, do: "Too low"
end
