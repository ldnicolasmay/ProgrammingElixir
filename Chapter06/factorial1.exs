defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end

Enum.map(0..10, &Factorial.of/1)
|> IO.inspect()
