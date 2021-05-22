defmodule Chop do

  defp sleep_time(), do: 0

  defp current_guess(actual, range, guess) when actual < guess do 
    low.._ = range
    new_guess = div(low + guess, 2)
    IO.puts("Is it #{new_guess}?")
    :timer.sleep(sleep_time())
    current_guess(actual, low..guess, new_guess)
  end

  defp current_guess(actual, range, guess) when actual > guess do 
    _..high = range
    new_guess = div(guess + high, 2)
    IO.puts("Is it #{new_guess}?")
    :timer.sleep(sleep_time())
    current_guess(actual, guess..high, new_guess)
  end

  defp current_guess(actual, _, guess) when actual == guess do 
    guess 
  end
    
  def guess(actual, range) do 
    low..high = range
    new_guess = div(low + high, 2)
    IO.puts("Is it #{new_guess}?")
    :timer.sleep(sleep_time())
    current_guess(actual, low..high, new_guess)
  end
  
end

Chop.guess(999, 0..999_999_999_999_999_999_999_999) |> IO.puts()
