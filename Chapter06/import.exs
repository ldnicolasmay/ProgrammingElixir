defmodule Example do
  def func1 do
    List.flatten([1, [2, 3], 4])
  end

  def func2 do
    # import directive: `flatten` only available w/in func2
    import List, only: [flatten: 1] 
    flatten([5, [6, 7], 8])
  end

  def func3 do
    # import directive: `flatten` and `duplicate` only available w/in func3
    import List, only: [flatten: 1, duplicate: 2]
    flattened_list = ["a", ["b", ["c", ["d"]]]] |> flatten()
    Enum.map(flattened_list, &(duplicate(&1, 5)))
  end

  def func4 do
    # alias directive
    alias List, as: Listificator
    ["a", ["b", ["c", ["d"]]]] |> Listificator.flatten()
  end
    
end

Example.func1() |> IO.inspect()
Example.func2() |> IO.inspect()
Example.func3() |> IO.inspect()
Example.func4() |> IO.inspect()
