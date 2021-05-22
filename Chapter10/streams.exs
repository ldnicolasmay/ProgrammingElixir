import Integer, only: [is_odd: 1]

[1, 2, 3, 4]
|> Stream.map(&(&1 + 1))
|> IO.inspect()

IO.puts("")

[1, 2, 3, 4]
|> Stream.map(&(&1 + 1))
|> IO.inspect()
|> Enum.to_list()
|> IO.inspect()

IO.puts("")

a_list = [1, 2, 3, 4]
squares = a_list |> Stream.map(&(&1 * &1))
plus_ones = squares |> Stream.map(&(&1 + 1))
odds = plus_ones |> Stream.filter(&is_odd/1)
odds |> Enum.to_list() |> IO.inspect()

IO.puts("")

[1, 2, 3, 4] |> IO.inspect(label: "start")
|> Stream.map(&(&1 * &1)) |> IO.inspect(label: "squares")
|> Stream.map(&(&1 + 1)) |> IO.inspect(label: "plus_ones")
|> Stream.filter(&is_odd/1) |> IO.inspect(label: "is_odd")
|> Enum.to_list() |> IO.inspect(label: "result")


