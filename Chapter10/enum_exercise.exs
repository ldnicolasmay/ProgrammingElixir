defmodule EnumExer do
  def all?([], _func), do: true
   
  def all?([head | tail], func) do 
    func.(head) and all?(tail, func)
  end

  def each([], _func), do: :ok

  def each([head | tail], func) do 
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []

  def filter([head | tail], func) do 
    if func.(head) do 
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, n), do: split_helper(list, n, {[], []})

  def split_helper([], _n, {list_1, list_2}) do 
    {Enum.reverse(list_1), Enum.reverse(list_2)}
  end
  
  def split_helper([head | tail], n, {list_1, list_2}) do 
    if n > 0 do 
      split_helper(tail, n - 1, {[head | list_1], list_2})
    else 
      split_helper(tail, n - 1, {list_1, [head | list_2]})
    end
  end

  def take([], _n), do: []
  def take(_list, 0), do: []

  def take([head | tail], n) do 
    [head | take(tail, n - 1)]
  end
end

EnumExer.all?([], &(&1 < 5)) |> IO.puts()
EnumExer.all?([1, 2, 3, 4], &(&1 < 5)) |> IO.puts()
EnumExer.all?([1, 2, 3, 4, 5], &(&1 < 5)) |> IO.puts()

IO.puts("")

EnumExer.each([], fn x -> IO.puts(x) end)
EnumExer.each(["foo", "bar"], fn x -> IO.puts(x) end)

IO.puts("")

EnumExer.filter([], &(&1 < 4)) |> IO.inspect()
EnumExer.filter([1, 2], &(&1 < 4)) |> IO.inspect()
EnumExer.filter([1, 2, 3, 4, 5], &(&1 < 4)) |> IO.inspect()

IO.puts("")

EnumExer.split([], 0) |> IO.inspect()
EnumExer.split([], 5) |> IO.inspect()
EnumExer.split([1, 2, 3], 0) |> IO.inspect()
EnumExer.split([1, 2, 3, 4, 5], 3) |> IO.inspect()

IO.puts("")

EnumExer.take([], 0) |> IO.inspect()
EnumExer.take([], 5) |> IO.inspect()
EnumExer.take([1, 2, 3, 4, 5], 0) |> IO.inspect()
EnumExer.take([1, 2, 3, 4, 5], 3) |> IO.inspect()

