Stream.resource(fn -> File.open!("/usr/share/dict/words") end,
  fn file ->
    case IO.read(file, :line) do 
      data when is_binary(data) -> {[data], file}
      _ -> {:halt, file}
    end
  end,
    fn file -> File.close(file) end 
)
|> IO.inspect()
|> Enum.to_list()
|> IO.inspect()
|> length()
|> IO.puts()

