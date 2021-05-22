defmodule Sum do
  def of_first(_, 0), do: 0
  def of_first([], _), do: 0
  def of_first([head | tail], n), do: head + of_first(tail, n - 1)
end

Sum.of_first([], 0) |> IO.puts()
Sum.of_first([1], 0) |> IO.puts()
Sum.of_first([], 1) |> IO.puts()
Sum.of_first([1, 2, 3, 4, 5], 5) |> IO.puts()
Sum.of_first([1, 2, 3, 4, 5], 3) |> IO.puts()
Sum.of_first([1, 2, 3, 4, 5], 7) |> IO.puts()
