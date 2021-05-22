str = 'wombat'

str |> IO.puts()

is_list(str) |> IO.puts()           # true
length(str) |> IO.puts()            # 6
Enum.reverse(str) |> IO.puts()      # tabmow

[67, 65, 84] |> IO.puts()           # CAT

:io.format("~w~n", [str])           # [119,111,109,98,97,116]

List.to_tuple(str) |> IO.inspect()  # {119, 111, 109, 98, 97, 116}
str ++ [0] |> IO.inspect()          # [119, 111, 109, 98, 97, 116, 0]

'∂x/∂y' |> IO.inspect()             # [8706, 120, 47, 8706, 121]

'pole' ++ 'vault' |> IO.puts()      # polevault
'pole' -- 'vault' |> IO.puts()      # poe

List.zip(['abc', '123']) |> IO.inspect()  # [{97, 49}, {98, 50}, {99, 51}]

[head | tail] = 'cat'
head |> IO.puts()  # 99
tail |> IO.puts()  # at
[head | tail] |> IO.puts() 

