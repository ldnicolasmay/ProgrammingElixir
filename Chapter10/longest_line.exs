File.read!("/usr/share/dict/words")
|> IO.inspect()
|> String.split("\n")
|> IO.inspect()
|> Enum.max_by(&String.length/1)
|> IO.inspect()

