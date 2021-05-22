defmodule Greeter do
  # def greet(greeting, name) do 
  #   IO.puts("#{greeting}!")
  #   IO.puts("How're you doing, #{name}?")
  # end
  def greet(greeting, name), do: (
    IO.puts("#{greeting}!")
    IO.puts("How're you doing, #{name}?")
  )
end
