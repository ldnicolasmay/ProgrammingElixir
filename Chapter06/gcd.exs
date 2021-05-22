defmodule GCD do
  def of(x, 0), do: x

  # def of(x, y), do: of(y, rem(x, y))
  def of(x, y)
      when is_integer(x) and is_integer(y) and x > 0 and y > 0 do
    of(y, rem(x, y))
  end
end
