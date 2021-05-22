defmodule Eratosthenes do
  def sieve([]), do: []

  def sieve([head | tail]) when head > 1 do
    with filtered_tail = Enum.filter(tail, fn t -> rem(t, head) != 0 end) 
    do 
      [head | sieve(filtered_tail)]
    end
  end

  def tc_sieve(list), do: _tc_sieve(list, []) |> Enum.reverse()
  defp _tc_sieve([], acc), do: acc
  defp _tc_sieve([head|tail], acc) do
    with filtered_tail = Enum.filter(tail, fn t -> rem(t, head) != 0 end)
    do
      _tc_sieve(filtered_tail, [head|acc])
    end
  end

  # def factorial(0), do: 1
  # def factorial(n), do: n * factorial(n - 1)

  def factorial(n), do: _fact(n, 1)
  defp _fact(0, acc), do: acc
  defp _fact(n, acc), do: _fact(n - 1, acc * n)
      
end

DateTime.utc_now() |> IO.inspect()

# m = 10_000  # 1_229
# m = 100_000  # 9_592
m = 500_000  # 
# m = 1_000_000  # 78_498

# primes = 2..m |> Enum.to_list() |> Eratosthenes.sieve()
primes = 2..m |> Enum.to_list() |> Eratosthenes.tc_sieve()
primes |> IO.inspect(label: "sieve")
primes |> length() |> IO.puts()

DateTime.utc_now() |> IO.inspect()

