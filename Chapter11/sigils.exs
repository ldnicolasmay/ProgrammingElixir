# Interpolation is the #{baz} in "foo #{bar} baz"

# ~C -> Character list with no escaping or interpolation
~C[1\n2#{1+2}] |> IO.puts()
~C[1\n2#{1+2}] ++ [0] |> IO.inspect(label: "char list")

# ~c -> Character list escaped and interpolated just like single-quoted string
# All below are the same
~c[1\n2#{1+2}] |> IO.puts()
~c"1\n2#{1+2}" |> IO.puts()
'1\n2#{1+2}' |> IO.puts()

~c[1\n2#{1+2}] ++ [0] |> IO.inspect(label: "char list")
~c'1\n2#{1+2}' ++ [0] |> IO.inspect(label: "char list")
'1\n2#{1+2}' ++ [0] |> IO.inspect(label: "char list")

# ~S -> String with no escaping or interpolation
~S[1\n2#{1+2}] |> IO.puts()
~S[1\n2#{1+2}] <> <<0>> |> IO.inspect(label: "string")

# ~s -> String escaped and interpolated just like double-quoted string
~s[1\n2#{1+2}] |> IO.puts()
~s[1\n2#{1+2}] <> <<0>> |> IO.inspect(label: "string")

# ~W -> List of whitespace-delimited words, with no escaping or interpolation
~W[the c#{'a'}t sat on the mat] |> IO.inspect(label: "word list (default strings)")
~W[the c#{'a'}t sat on the mat]a |> IO.inspect(label: "atom list") # a returns atoms
~W[the c#{'a'}t sat on the mat]c |> IO.inspect(label: "char list list") # c returns char list
~W[the c#{'a'}t sat on the mat]s |> IO.inspect(label: "string list") # s returns strings

# ~w -> List of whitespace-delimited words, escaped and interpolated
~w[the c#{'a'}t sat on the mat] |> IO.inspect(label: "word list (default strings)")
~w[the c#{'a'}t sat on the mat]a |> IO.inspect(label: "atom list") # a returns atoms
~w[the c#{'a'}t sat on the mat]c |> IO.inspect(label: "char list list") # c returns char list
~w[the c#{'a'}t sat on the mat]s |> IO.inspect(label: "string list") # s returns strings

# ~D -> Date in format yyyy-mm-dd
~D[2020-01-01] |> IO.inspect(label: "date")

# ~T -> Time in format hh:mm:ss[.dddddd]
~T[12:34:56.1234567890] |> IO.inspect(label: "time")
#                | precision up to the 6 places after the decimal

# ~N -> Naive DateTime in format yyyy-mm-dd hh:mm:ss[.dddddd]
~N[2020-01-01 12:34:56.123456] |> IO.inspect(label: "naive datetime")

# ~U -> DateTime with timezone
~U[2020-01-01 12:34:56.123456+00:00] |> IO.inspect(label: "UTC datetime")
~U[2020-01-01 12:34:56.123456Z] |> IO.inspect(label: "UTC datetime")


# Sigil delimiters can be any nonword character:
#   ( )
#   [ ]
#   { }
#   < >
#   / /
#   \ \
#   ' '
#   " "
#   | |

