defmodule Outer do

  defmodule Inner do
    def inner_func do 
      IO.puts("inner_func")
    end
  end

  def outer_func do 
    IO.puts("outer_func")
  end
end

Outer.outer_func()
Outer.Inner.inner_func()
