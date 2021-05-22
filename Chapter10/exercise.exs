defmodule Exercise do

  def span(to, to) when is_integer(to), do: [to]

  def span(from, to) when is_integer(from) and is_integer(to) do 
    span_helper(from, to)
  end

  def span_helper(from, to) when from < to do 
    [from | span(from + 1, to)]
  end

  def span_helper(from, to) when from > to do 
    [from | span(from - 1, to)]
  end

  def prime_sieve([]), do: []

  def prime_sieve([n | ns]) when n > 1 do
    # with filtered_ns = Enum.filter(ns, fn num -> rem(num, n) != 0 end) 
    with filtered_ns = Enum.filter(ns, &(rem(&1, n) != 0)) 
    do 
      [n | prime_sieve(filtered_ns)]
    end
  end
      
  def primes(n) when is_integer(n) and n > 1 do
    span(2, n) |> prime_sieve()
  end

  def calc_order_total(order = [_id, _ship_to, {:net_amount, amt}], rate \\ 0) do
    with total = amt * (1 + rate) |> Float.round(2) do
      Keyword.merge(order, [total_amount: total])
    end
  end
  
  def process_orders(orders, rates) do
    for order = [_id, {:ship_to, dest}, _net_amount] <- orders do
      if Keyword.has_key?(rates, dest) do
        calc_order_total(order, rate=Keyword.get(rates, dest))
      else 
        calc_order_total(order)
      end
    end
  end
end

Exercise.primes(2) |> IO.inspect(label: "2")
Exercise.primes(3) |> IO.inspect(label: "3")
Exercise.primes(4) |> IO.inspect(label: "4")
Exercise.primes(5) |> IO.inspect(label: "5")
Exercise.primes(20) |> IO.inspect(label: "20")
Exercise.primes(100) |> IO.inspect(label: "100")
Exercise.primes(1000) |> IO.inspect(label: "1000", limit: :infinity)
Exercise.primes(10000) |> IO.inspect(label: "10000", limit: :infinity)

IO.puts("")

tax_rates = [CA: 0.20, MI: 0.0675, NC: 0.075, TX: 0.08]
orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 130, ship_to: :NC, net_amount: 50.00],
  [id: 131, ship_to: :MI, net_amount: 75.00],
]

Exercise.process_orders(orders, tax_rates) |> IO.inspect()


