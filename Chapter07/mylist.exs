defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum(list, func), do: map(list, func) |> reduce(0, &(&1 + &2))

  def maxxx([a]), do: a
  def maxxx([a, b | tail]) when a >= b, do: maxxx([a | tail])
  def maxxx([a, b | tail]) when a < b, do: maxxx([b | tail])

  def caesar([], _n), do: []

  def caesar([head | tail], n) do
    # ?a = 97, ?z = 122, distance = 26
    with first_char = ?a,
         last_char = ?z,
         distance = last_char - first_char + 1,
         caesared_char = rem(head + n - first_char, distance) + first_char do
      [caesared_char | caesar(tail, n)]
    end
  end

  def span(to, to) when is_integer(to), do: [to]

  # def span(from, to) when is_integer(from) and is_integer(to) and from < to do 
  #   [from | span(from + 1, to)]
  # end

  # def span(from, to) when is_integer(from) and is_integer(to) and from < to do 
  #   [from | span(from + 1, to)]
  # end

  def span(from, to) when is_integer(from) and is_integer(to) do 
    span_helper(from, to)
  end

  def span_helper(from, to) when from < to do 
    [from | span(from + 1, to)]
  end

  def span_helper(from, to) when from > to do 
    [from | span(from - 1, to)]
  end
end

[] |> MyList.len() |> IO.puts()
[1] |> MyList.len() |> IO.puts()
[1, 2, 3, 4, 5] |> MyList.len() |> IO.puts()

1..10000 |> Enum.to_list() |> MyList.len() |> IO.puts()

[1, 2, 3, 4, 5] |> MyList.square() |> IO.inspect()

[1, 2, 3, 4, 5] |> MyList.map(&(&1 * &1)) |> IO.inspect()
triple = fn n -> n * 3 end
[1, 2, 3, 4, 5] |> MyList.map(triple) |> IO.inspect()

[1, 2, 3, 4, 5] |> MyList.reduce(0, &(&1 + &2)) |> IO.puts()
[1, 2, 3, 4, 5] |> MyList.reduce(1, &(&1 * &2)) |> IO.puts()
1..50 |> Enum.to_list() |> MyList.reduce(1, &(&1 * &2)) |> IO.puts()

[1, 2, 3] |> MyList.mapsum(&(&1 * &1)) |> IO.puts()

# [] |> MyList.max() |> IO.puts() # MyList.max([]) is undefined
[1] |> MyList.maxxx() |> IO.puts()
[1, 2] |> MyList.maxxx() |> IO.puts()
[1, 2, 3] |> MyList.maxxx() |> IO.puts()
[3, 2, 1] |> MyList.maxxx() |> IO.puts()
["baz", "qux", "foo", "bar"] |> MyList.maxxx() |> IO.puts()

'ryvkve' |> MyList.caesar(13) |> IO.puts()
'I\'ve been workin\' on the railroad' |> MyList.caesar(2) |> IO.puts()

MyList.span(0, 0) |> IO.inspect()
MyList.span(0, 1) |> IO.inspect()
MyList.span(0, 2) |> IO.inspect()
MyList.span(0, 25) |> IO.inspect()
MyList.span(1, 0) |> IO.inspect()
MyList.span(2, 0) |> IO.inspect()
MyList.span(25, 0) |> IO.inspect()
