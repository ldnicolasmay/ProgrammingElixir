defmodule DefaultParams1 do 
  # def func(p1, p2 \\ 123) do
  #   IO.inspect([p1, p2])
  # end

  # def func(p1, 99) do 
  #   IO.puts("You said 99")
  # end 

  def func(p1, p2 \\ 123)

  def func(p1, 99) do 
    IO.puts("You said 99")
  end

  def func(p1, p2) do 
    IO.inspect([p1, p2])
  end
end

DefaultParams1.func("cat")
DefaultParams1.func("cat", 456)
DefaultParams1.func("cat", 99)
