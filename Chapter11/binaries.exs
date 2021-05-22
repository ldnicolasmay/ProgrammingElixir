defmodule MyBinaries do
  def center(list) do 
    with list_lens = list |> Enum.map(&String.length/1),
         max_len = list_lens |> Enum.max(),
         list_lens_max_diffs_halved = list_lens
                                      |> Enum.map(&(max_len - &1))
                                      |> Enum.map(&div(&1, 2))
    do
      Enum.zip(list, list_lens_max_diffs_halved) 
      |> Enum.map(fn {str, pad} -> String.duplicate(" ", pad) <> str end)
    end
  end

  def triangle(n) when is_integer(n) and n > 0 do 
    (1..n)
    |> Enum.map(&(&1 * 2 - 1))
    |> Enum.map(&String.duplicate("*", &1))
    |> center()
  end
end

MyBinaries.center(["cat", "zebra", "elephant"])
|> Enum.each(&IO.puts/1)

MyBinaries.center(["a", "ab", "abc", "abcd", "abcde", "abcdef", "abcdefg"])
|> Enum.each(&IO.puts/1)

MyBinaries.center(["a", "abc", "abcde", "abcdefg", "abcdefghi"])
|> Enum.each(&IO.puts/1)

MyBinaries.triangle(1) |> Enum.each(&IO.puts/1)
MyBinaries.triangle(2) |> Enum.each(&IO.puts/1)
MyBinaries.triangle(4) |> Enum.each(&IO.puts/1)
MyBinaries.triangle(8) |> Enum.each(&IO.puts/1)
MyBinaries.triangle(16) |> Enum.each(&IO.puts/1)

