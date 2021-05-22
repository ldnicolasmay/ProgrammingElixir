defmodule Exercise do

  @white_vals [9, 10, 11, 12, 13, 32]
  @punct_vals Enum.to_list(33..47) ++ Enum.to_list(58..64) ++
      Enum.to_list(91..96) ++ Enum.to_list(123..126)

  def is_ascii?(char) do 
    char >= 32 and char <= 126
  end

  def are_ascii?(word) when is_list(word) do 
    List.foldl(word, true, fn x, acc -> is_ascii?(x) and acc end)
  end

  def _del_stuff('', _), do: ''

  def _del_stuff([head | tail], stuff) do
    if head in stuff do 
      _del_stuff(tail, stuff)
    else
      [head | _del_stuff(tail, stuff)]
    end
  end

  def _del_white(word), do: _del_stuff(word, @white_vals)
  def _del_punct(word), do: _del_stuff(word, @punct_vals)

  def _downcase(''), do: ''

  def _downcase([head | tail]) when head >= 65 and head <= 90 do 
    [head + 32 | _downcase(tail)]
  end

  def _downcase([head | tail]) 
  when (head >= 97 and head <= 122) or head in @white_vals or head in @punct_vals do
    [head | _downcase(tail)]
  end

  def _anagram?('', ''), do: true
  def _anagram?([_ | _], ''), do: false
  def _anagram?('', [_ | _]), do: false

  def _anagram?([head | tail], word2) do 
    _anagram?(tail, List.delete(word2, head))
  end

  def anagram?(word1, word2, opts \\ [del_white: false, del_punct: false, downcase: false]) do
    with word1a = if(opts[:del_white], do: _del_white(word1), else: word1),
      word2a = if(opts[:del_white], do: _del_white(word2), else: word2),
      word1b = if(opts[:downcase], do: _downcase(word1a), else: word1a),
      word2b = if(opts[:downcase], do: _downcase(word2a), else: word2a)
    do
      _anagram?(word1b, word2b)
    end
  end

  # Regex.scan(~r{[+-/*]}, "123 + 456") |> List.flatten
  # Regex.scan(~r{\d+}, "123 + 456") |> List.flatten
  # Regex.run(~r|(\d+) ([+-\\*/]) (\d+)|, "123 + 456", [capture: :all_but_first])
  def apply_operator("+", num1, num2), do: num1 + num2
  def apply_operator("-", num1, num2), do: num1 - num2
  def apply_operator("*", num1, num2), do: num1 * num2
  def apply_operator("/", num1, num2), do: num1 / num2

  def parse_expr(expr) do
    with [str1, oper, str2] = Regex.run(
      ~r|(\d+) ([+-\\*/]) (\d+)|, expr, [capture: :all_but_first]
    ) do 
      apply_operator(oper, String.to_integer(str1), String.to_integer(str2))
    end
  end
end

'abc' |> Enum.map(&Exercise.is_ascii?/1) |> IO.inspect()
'¡¢£¤¥¦§¨©ª«' |> Enum.map(&Exercise.is_ascii?/1) |> IO.inspect()

' !"#$%&\'()*+,-./'          |> Exercise.are_ascii?() |> IO.inspect()
'0123456789:;<=>?@'          |> Exercise.are_ascii?() |> IO.inspect()
'ABCDEFGHIJKLMNOPQRSTUVWXYZ' |> Exercise.are_ascii?() |> IO.inspect()
'[\]^_`'                     |> Exercise.are_ascii?() |> IO.inspect()
'abcdefghijklmnopqrstuvwxyz' |> Exercise.are_ascii?() |> IO.inspect()
'{|}~'                       |> Exercise.are_ascii?() |> IO.inspect()

IO.puts("")

Exercise.anagram?([], []) |> IO.puts()
Exercise.anagram?('abc', []) |> IO.inspect(label: "abc ")
Exercise.anagram?('abc', '') |> IO.inspect(label: "abc ")
Exercise.anagram?('a', 'a') |> IO.inspect(label: "a, a")
Exercise.anagram?('ba', 'ab') |> IO.inspect(label: "ba, ab")
Exercise.anagram?('ba', 'abc') |> IO.inspect(label: "ba, abc")
Exercise.anagram?('pupils', 'slipup') |> IO.inspect(label: "pupils, slipup")
Exercise.anagram?('listen', 'silent') |> IO.inspect(label: "listen, silent")
Exercise.anagram?('lis ten', 'silent', del_white: true) 
|> IO.inspect(label: "lis ten, silent")
Exercise.anagram?('Listen', 'silent', downcase: true) 
|> IO.inspect(label: "Listen, silent")
Exercise.anagram?('New York Times', 'monkey writes', del_white: true, downcase: true)
|> IO.inspect(label: "New York Times, monkey writes")
Exercise.anagram?('lis-ten', 'silent', del_punct: true) 
|> IO.inspect(label: "lis-ten, silent")

IO.puts("")

Exercise.parse_expr("12 + 3") |> IO.inspect()
Exercise.parse_expr("12 - 3") |> IO.inspect()
Exercise.parse_expr("12 * 3") |> IO.inspect()
Exercise.parse_expr("12 / 3") |> IO.inspect()

