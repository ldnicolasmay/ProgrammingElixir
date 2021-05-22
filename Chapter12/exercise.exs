defmodule FizzBuzz do 

  def upto(n) do 
    1..n |> Enum.map(&fizzbuzz(&1))
  end

  def fizzbuzz(n) do 
    case {n, rem(n, 3), rem(n, 5)} do 
      {_, 0, 0} -> "FizzBuzz"
      {_, 0, _} -> "Fizz"
      {_, _, 0} -> "Buzz"
      _ -> n
    end
  end

  def ok!({:ok, data}), do: data
  def ok!({foo, bar}), do: raise("info about parameter: #{foo} #{bar}")

end

FizzBuzz.upto(15) |> IO.inspect()

FizzBuzz.ok!(File.open("exercise.exs")) |> IO.read(:line) |> IO.inspect()
# FizzBuzz.ok!(File.open("somefile")) |> IO.inspect()

