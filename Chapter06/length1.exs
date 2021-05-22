defmodule Length do
  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)
end

Length.of([]) |> IO.puts()
Length.of([1]) |> IO.puts()
Length.of([1, 2, 3, 4, 5]) |> IO.puts()
