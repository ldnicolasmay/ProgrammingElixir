[1, 2, 3, 4, 5]
|> IO.inspect()
|> Enum.map(&(&1 * &1))
|> IO.inspect()
|> Enum.with_index()
|> IO.inspect()
|> Enum.map(fn {value, index} -> value - index end)
|> IO.inspect()

