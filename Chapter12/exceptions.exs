user_file_name = "exceptions.exs"
# user_file_name = "foo.exs"

case File.open(user_file_name) do 
  {:ok, file} -> IO.read(file, :line) |> IO.inspect()
  {:error, message} -> IO.puts(:stderr, "Couldn't open #{user_file_name} d.t. #{message}")
end

file = File.open!(user_file_name)
file |> IO.read(:line) |> IO.inspect()

