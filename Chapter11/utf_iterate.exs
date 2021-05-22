defmodule Utf8 do
  def each(str, func) when is_binary(str), do: _each(str, func)

  # defp _each([], _func), do: []
  defp _each(<<>>, _func), do: <<>>

  # defp _each([head | tail], func) do
  #   func.(head)
  #   _each(tail, func)
  # end
  defp _each(<<head::utf8, tail::binary>>, func) do 
    func.(head)
    _each(tail, func)
  end

  def capitalize_sentences(str) when is_binary(str) do 
    String.split(str, " ", trim: true)
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  def calc_order_total(order = [_id, _ship_to, {:net_amount, amt}], rate \\ 0) do
    with total = amt * (1 + rate) |> Float.round(2) do
      Keyword.merge(order, [total_amount: total])
    end
  end

  # # This is an anti-pattern. `process_order` below is an improvement.
  # def process_orders(orders, rates) do
  #   for order = [_id, {:ship_to, dest}, _net_amount] <- orders do
  #     if Keyword.has_key?(rates, dest) do
  #       calc_order_total(order, Keyword.get(rates, dest))
  #     else 
  #       calc_order_total(order)
  #     end
  #   end
  # end

  def process_order(order = [_id, {:ship_to, dest}, _net_amount], rates) do 
    if Keyword.has_key?(rates, dest) do 
      calc_order_total(order, Keyword.get(rates, dest))
    else 
      calc_order_total(order)
    end
  end
  
  def parse_header([id, dest, amt]) do 
    [String.to_atom(id), String.to_atom(dest), String.to_atom(amt)]
  end

  def parse_record([id, dest, amt]) do 
    with clean_dest = dest 
                      |> String.trim_leading(":")
                      |> String.trim(" ")
    do
      [String.to_integer(id), String.to_atom(clean_dest), String.to_float(amt)]
    end
  end

  # # This isn't as good as read_order_data_2
  # def read_order_data(file) do 
  #   with contents <- File.read!(file) |> String.split("\n", trim: true),
  #        header = contents
  #                 |> Enum.take(1)
  #                 |> Enum.map(&String.split(&1, ","))
  #                 |> Enum.flat_map(&parse_header/1),
  #        data = contents 
  #               |> Enum.drop(1)
  #               |> Enum.map(&String.split(&1, ","))
  #               |> Enum.map(&parse_record/1)
  #   do
  #     data |> Enum.map(&Enum.zip(header, &1))
  #   end
  # end

  def read_order_data_2(file) do 
    with file <- File.open!(file),
         header = IO.read(file, :line) 
                  |> String.trim("\n")
                  |> String.split(",")
                  |> parse_header
    do
      IO.stream(file, :line)
      |> Stream.map(&String.trim(&1, "\n"))
      |> Stream.map(&String.split(&1, ","))
      |> Stream.map(&parse_record/1)
      |> Stream.map(&Enum.zip(header, &1))
    end
  end
end

Utf8.each("∂og", fn char -> IO.puts(char) end)

Utf8.capitalize_sentences("oh. a DOG. woof. ") 
|> IO.inspect(label: "capitalize_sentences")
# Utf8.capitalize_sentences("oh. a DOG. woof.") 
# |> IO.inspect(label: "capitalize_sentences")

tax_rates = [CA: 0.20, MI: 0.0675, NC: 0.075, TX: 0.08]

# Utf8.read_order_data("sales_tax.csv")
# |> IO.inspect(label: "read_order_data")
# Utf8.read_order_data("sales_tax.csv")
# |> Enum.map(&Utf8.process_order(&1, tax_rates))
# |> IO.inspect(label: "read_order_data")

Utf8.read_order_data_2("sales_tax.csv")
|> Stream.map(&Utf8.process_order(&1, tax_rates))
|> Enum.to_list()
|> IO.inspect(label: "read_order_data_2")

