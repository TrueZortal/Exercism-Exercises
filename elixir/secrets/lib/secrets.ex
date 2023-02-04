defmodule Secrets do
  def secret_add(secret) do
    adder = fn num ->
      secret + num
    end
  end

  def secret_subtract(secret) do
    substractor = fn num ->
      num - secret
    end
  end

  def secret_multiply(secret) do
    multiplier = fn num ->
      num * secret
    end
  end

  def secret_divide(secret) do
    divider = fn num ->
      div(num,secret)
    end
  end

  def secret_and(secret) do
    ander = fn num ->
      Bitwise.band(num, secret)
    end
  end

  def secret_xor(secret) do
    xorer = fn num ->
      Bitwise.bxor(num, secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    combined = fn num ->
      secret_function2.(secret_function1.(num))
    end
  end
end
