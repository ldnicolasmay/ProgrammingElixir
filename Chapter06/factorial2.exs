defmodule Factorial do
  def of(0), do: 1

  # def of(n), do: n * of(n - 1)
  def of(n) when is_integer(n) and n > 0 do 
    n * of(n - 1)
  end
end

Enum.map(0..10, &Factorial.of/1)
|> IO.inspect()
