defmodule Foo do

  def foo() do
    IO.puts("foo")
  end
  
end

# Foo.foo()


sum = fn (a, b) -> a + b end
sum.(2, 3) |> IO.puts()

greet1 = fn -> IO.puts("Hello 1") end
greet1.()

greet2 = fn () -> IO.puts("Hello 2") end
greet2.()

f1 = fn a, b -> a * b end
f1.(2, 3) |> IO.puts()

f2 = fn -> 99 end
f2.() |> IO.puts()

swap = fn {a, b} -> {b, a} end
swap.({1, 2}) |> IO.inspect()

list_concat = fn list1, list2 -> list1 ++ list2 end
list_concat.([:a, :b], [:c, :d]) |> IO.inspect()

sum2 = fn a, b, c -> a + b + c end
sum2.(1, 2, 3) |> IO.inspect()

pair_tuple_to_list = fn {a, b} -> [a, b] end
pair_tuple_to_list.({1234, 5678}) |> IO.inspect()

handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

# handle_open.(File.open("./foo.exs")) |> IO.puts()
File.open("./foo.exs")
|> handle_open.()
|> IO.puts()

# handle_open.(File.open("./nonexistent.exs")) |> IO.puts()
File.open("./nonexistent.exs")
|> handle_open.()
|> IO.puts()

fizz_buzz_backend = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

fizz_buzz = fn
  n -> fizz_buzz_backend.(rem(n, 3), rem(n, 5), n)
end

fizz_buzz.(10) |> IO.puts()
fizz_buzz.(11) |> IO.puts()
fizz_buzz.(12) |> IO.puts()
fizz_buzz.(13) |> IO.puts()
fizz_buzz.(14) |> IO.puts()
fizz_buzz.(15) |> IO.puts()
fizz_buzz.(16) |> IO.puts()

fun1 = fn -> fn -> "Hello1" end end
fun1.() |> IO.inspect()
fun1.().() |> IO.puts()

fun2 = fn 
  () -> fn 
    () -> "Hello2"
  end
end
fun2.() |> IO.inspect() # returns a fxn that takes nothing and returns Hello
fun3 = fun2.()
fun3.() |> IO.puts()


greeter = fn
  name -> fn () -> "Hello, #{name}!" end
end

nic_greeter = greeter.("Nic")
nic_greeter.() |> IO.puts()

add_n = fn
  n -> fn other -> n + other end
end

add_two = add_n.(2)
add_five = add_n.(5)

add_n.(11).(13) |> IO.puts()
add_two.(3) |> IO.puts()
add_five.(7) |> IO.puts()


prefix = fn
  str_1 -> fn str_2 -> str_1 <> " " <> str_2 end
end

mrs_prefix = prefix.("Mrs.")
mrs_prefix.("Smith") |> IO.puts()

prefix.("Elixir").("rocks!") |> IO.puts()


times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end
apply.(times_2, 6) |> IO.puts()
Enum.map([1, 2, 3], times_2) |> IO.inspect()
Enum.map([1, 2, 3], fn n -> n * 2 end) |> IO.inspect()

my_list = [1, 3, 5, 7, 9]
Enum.map(my_list, times_2) |> IO.inspect()
Enum.map(my_list, fn n -> n * n end) |> IO.inspect()
Enum.map(my_list, fn n -> n > 6 end) |> IO.inspect()


add_one = &(&1 + 1)  # shorthand for: fn n -> n + 1 end
add_one.(44) |> IO.puts()

square = &(&1 * &1)
Enum.map(my_list, square) |> IO.inspect()

speak = &(IO.puts(&1))
speak.("Hello") |> IO.inspect()

# prefix_2 = &(&1 &(&1 <> " " <> &2))
# prefix_2 = fn str_1 -> fn str_2 -> str_1 <> " " <> str_2 end end
prefix_2 = fn str_1 -> &(str_1 <> " " <> &1) end
prefix_2.("foo").("bar") |> IO.puts()
prefix_2.("a").("b") |> IO.puts()

add_stuff = &(&1 + &2)
add_stuff.(13, 17) |> IO.puts()

divrem = &{div(&1, &2), rem(&1, &2)}
divrem.(13, 5) |> IO.inspect()

s = &"bacon and #{&1}"
s.("custard") |> IO.puts()

# match_end = &~r/.*#{&1}$/
# "cat" =~ match_end.("t") |> IO.puts()
# "cat" =~ match_end.("!") |> IO.puts()

l = &length/1
len = &Enum.count/1
m = &Kernel.min/2

l.([1, 3, 5, 7]) |> IO.puts()
len.([1, 3, 5, 7]) |> IO.puts()
m.(99, 98) |> IO.puts()

Enum.map([1, 2, 3, 4], &(&1 + 1)) |> IO.inspect()
Enum.map([1, 2, 3, 4], &(&1 * &1)) |> IO.inspect()
Enum.map([1, 2, 3, 4], &(&1 < 3)) |> IO.inspect()

Enum.map([1, 2, 3, 4], &(&1 + 2)) |> IO.inspect()
Enum.map([1, 2, 3, 4], &(IO.inspect(&1)))
Enum.map([1, 2, 3, 4], &(IO.inspect(&1))) |> IO.inspect()









