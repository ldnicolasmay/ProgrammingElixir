defmodule Example do
  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr
end

IO.puts("first=#{Example.first()} second=#{Example.second()}")
