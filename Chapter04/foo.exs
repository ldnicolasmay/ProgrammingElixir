defmodule Foo do

  def rgx_replace_swap(string, regex, replace) do
    Regex.replace(regex, string, replace)
  end

  def main() do
    # Data Types

    # Atom

    IO.puts(:atom)
    IO.puts(:"This is an atom, too!")

    # Regex: ~r{...}

    Regex.run(~r{[aeiou]}, "caterpillar")
    |> IO.puts()

    Regex.scan(
      ~r{[aeiou]},
      "caterpillar"
    )
    |> IO.inspect()

    Regex.scan(~r{[aeiou]}, "caterpillar")
    |> List.flatten()
    |> IO.inspect()

    Regex.scan(~r{[aeiou]}, "aeolian islands")
    |> IO.inspect()

    Regex.scan(~r{[aeiou]}, "aeolian islands")
    |> List.flatten()
    |> IO.inspect()

    Regex.split(~r{[aeiou]}, "caterpillar")
    |> IO.inspect()

    Regex.replace(~r{[aeiou]}, "caterpillar", "_")
    |> IO.puts()

    # Collections

    # Tuples

    {1, 2} |> IO.inspect()

    {:ok, 42, "next"} |> IO.inspect()

    # pattern matching on tuples
    {status, count, action} = {:ok, 42, "next"}
    IO.puts("status: #{status}")
    IO.puts("count: #{count}")
    IO.puts("action: #{action}")

    {status, file} = File.open("foo.exs")
    IO.puts("status: #{status}")
    file |> IO.inspect()

    # Lists

    ([1, 2, 3] ++ [4, 5, 6]) |> IO.inspect()

    ([1, 2, 3, 4] -- [2, 4]) |> IO.inspect()

    (1 in [1, 2, 3, 4]) |> IO.puts()

    ("wombat" in [1, 2, 3, 4]) |> IO.puts()

    # Keyword Lists

    [
      name: "Nic",
      city: "Ann Arbor",
      likes: "Functional Programming"
    ]
    |> IO.inspect()

    my_info_1 = [
      name: "Nic",
      city: "Ann Arbor",
      likes: "Functional Programming"
    ]

    my_info_2 = [
      {:name, "Nic"},
      {:city, "Ann Arbor"},
      {:likes, "Functional Programming"}
    ]

    IO.inspect(my_info_1)
    IO.inspect(my_info_2)
    IO.puts(my_info_1 === my_info_2)

    # Maps

    states = %{"AL" => "Alabama", "AK" => "Alaska"}
    IO.inspect(states)

    responses = %{
      {:error, :enoent} => :fatal,
      {:error, :busy} => :retry
    }

    IO.inspect(responses)

    colors = %{
      :red => 0xFF0000,
      :green => 0x00FF00,
      :blue => 0x0000FF
    }

    IO.inspect(colors, label: "colors")
    IO.inspect(colors, width: 20)
    IO.inspect(colors, label: "colors", width: 20)

    colors
    |> IO.inspect(label: "colors", width: 20)

    mixed_types = %{
      "one" => 1,
      :two => 2,
      {1, 1, 1} => 3
    }

    IO.inspect(mixed_types)

    name = "Nic May"
    %{String.downcase(name) => name} |> IO.inspect()
    %{(name |> String.downcase()) => name} |> IO.inspect()

    %{(name |> String.downcase() |> Foo.rgx_replace_swap(~r{\s}, "")) => name}
    |> IO.inspect()

    states["AK"] |> IO.puts()

    states["TX"] |> IO.puts()
    states["TX"] |> IO.inspect()

    colors |> IO.inspect()
    colors[:red] |> IO.puts()
    # dot notation for atom-keyed dictionary value
    colors.red |> IO.puts()

    # Binaries

    bin = <<1, 2>>

    bin |> IO.inspect()

    byte_size(bin) |> IO.puts()

    bin = <<3::size(2), 5::size(4), 1::size(2)>>
    bin |> IO.inspect()

    :io.format("~-8.2b~n", :binary.bin_to_list(bin)) |> IO.puts()

    # Dates and Times

    d1 = Date.new(2018, 12, 25)

    d1 |> IO.inspect()

    {:ok, d1} = Date.new(2018, 12, 25)

    d1 |> IO.inspect()

    d2 = ~D[2018-12-25]

    d2 |> IO.inspect()

    (d1 == d2) |> IO.puts()

    Date.day_of_week(d1) |> IO.puts()

    Date.add(d1, 7) |> IO.inspect()

    inspect(d1, structs: false) |> IO.inspect()
    inspect(d1, structs: false) |> IO.inspect()

    d1 = ~D[2018-01-01]
    d2 = ~D[2018-06-30]
    first_half = Date.range(d1, d2)

    Enum.count(first_half) |> IO.puts()

    (~D[2018-03-15] in first_half) |> IO.puts()

    t1 = Time.new(12, 34, 56)
    t1 |> IO.inspect()

    {:ok, t1} = Time.new(12, 34, 56)
    t1 |> IO.inspect()

    t2 = ~T[12:34:56.78]
    t3 = ~T[12:34:56.780]
    (t1 == t2) |> IO.puts()
    (t2 == t3) |> IO.puts()

    Time.add(t1, 3600, :second) |> IO.inspect()
    Time.add(t1, 3600, :millisecond) |> IO.inspect()

    dt1 = DateTime.new(~D[2021-04-18], ~T[09:42:17])
    dt1 |> IO.inspect()
    {:ok, dt1} = DateTime.new(~D[2021-04-18], ~T[09:42:17])
    dt1 |> IO.inspect()

    dt2 = ~U[2021-04-18 09:42:17Z]
    dt2 |> IO.inspect()

    dt3 = ~U[2021-04-18 09:42:17+00:00]
    dt3 |> IO.inspect()

    (dt1 == dt2) |> IO.inspect()
    (dt1 == dt3) |> IO.inspect()

    # Names, Source Files, Conventions, Operators, and So On

    # Boolean Operators

    (false or false) |> IO.puts()
    (false or true) |> IO.puts()
    (false and true) |> IO.puts()
    (true and true) |> IO.puts()
    not true |> IO.puts()
    not false |> IO.puts()

    # Relaxed Boolean Operators
    # - similar to how Python boolean operators work with truthy/falsy values
    # - false and nil are falsy, everything else is truthy

    (3 || 5) |> IO.puts()  # evalutes to 3
    (false || 5) |> IO.puts()  # evals to 5
    (5 || false) |> IO.puts()  # evals to 5
    (3 && 5) |> IO.puts()  # evalutes to 5
    (false && 5) |> IO.puts()  # evalutes to false
    (5 && false) |> IO.puts()  # evalutes to false
    (!3) |> IO.puts()  # evalutes to false
    (!true) |> IO.puts()  # evals to false
    (!nil) |> IO.puts()  # evals to true
    (!false) |> IO.puts()  # evals to true

    # Arithmetic operators: + - * / div rem
    # div is integer division
    # rem is modulo
    div(11, 3) |> IO.puts()  # evals to 3
    rem(11, 3) |> IO.puts()  # evals to 2

    # Join operators
    # <> concatenates two binaries (strins are binaries)
    # ++ concatenates two lists
    # -- removes elements of list 2 from a copy of list 1
    ("foo" <> "bar") |> IO.puts()
    (<<1, 2, 3>> <> <<4, 5, 6>>) |> IO.inspect()


    "---end---"
  end
end

Foo.main()

