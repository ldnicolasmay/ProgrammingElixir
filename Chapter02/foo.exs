a = 1

IO.puts "a: #{a}"

IO.puts "a + 3: #{a + 3}"

1 = a

# 2 = a  # Doesn't compile d.t. pattern match error

list = [1, 2, 3]
# IO.puts list  # Not very useful
IO.inspect list

[a, b, c] = list
IO.puts "a: #{a}"
IO.puts "b: #{b}"
IO.puts "c: #{c}"

list = [1, 2, [3, 4, 5]]
[a, b, c] = list
IO.puts "a: #{a}"
IO.puts "b: #{a}"
IO.inspect c, label: "c"

[1, _, _] = [1, 2, 3]

[a, a] = [1, 1]
IO.puts "a: #{a}"

# [b, b] = [1, 2]  # Doesn't compile d.t. pattern match error

a = 1
1 = a

[^a, 2, 3] = [1, 2, 3]
# [^a, 2, 3] = [4, 2, 3]  # pattern match error
