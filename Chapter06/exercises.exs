:io.format("~.2f~n", [123456.78901]) |> IO.puts()

# System.get_env() |> IO.inspect()
System.get_env("ZSH") |> IO.puts()

Path.extname("/home/hynso/temp/LDNM_passwords.kdbx") |> IO.puts()

File.cwd() |> IO.inspect()
# get_path = fn {:ok, path} -> path end
get_path = fn
  {:ok, path} -> path
  {:error, error} -> :file.format_error(error)
end
File.cwd() |> get_path.() |> IO.inspect()

# Jason module here: https://hexdocs.pm/jason/readme.html

System.version() |> IO.puts()

# System.cmd("cat", ["attributes.exs"]) |> IO.inspect()
# System.cmd("ls", ["."]) |> IO.inspect()
# System.cmd("ls", [".", "-a", "-l"]) |> IO.inspect()

# get_output = fn {output, status} -> output end
# System.cmd("ls", [".", "-a", "-l"]) |> get_output.() |> IO.puts()
System.cmd("ls", [".", "-a", "-l"])
|> (fn {output, status} -> output end).()
|> IO.puts()

