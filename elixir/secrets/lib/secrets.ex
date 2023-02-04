defmodule Secrets do
  def secret_add(secret) do
    adder = &(secret + &1)
  end

  def secret_subtract(secret) do
    substractor = &(&1 - secret)
  end

  def secret_multiply(secret) do
    multiplier = &(&1 * secret)
  end

  def secret_divide(secret) do
    divider = &(div(&1,secret))
  end

  def secret_and(secret) do
    ander = &(Bitwise.band(&1, secret))
  end

  def secret_xor(secret) do
    xorer = &(Bitwise.bxor(&1, secret))
  end

  def secret_combine(secret_function1, secret_function2) do
    combined = &(secret_function2.(secret_function1.(&1)))
  end
end
