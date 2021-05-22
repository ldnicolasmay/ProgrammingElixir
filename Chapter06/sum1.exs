defmodule Sum do
  def of([]), do: 0
  def of([head | tail]), do: head + of(tail)
end

Sum.of([]) |> IO.puts()
Sum.of([1]) |> IO.puts()
Sum.of([1, 2, 3, 4, 5]) |> IO.puts()
