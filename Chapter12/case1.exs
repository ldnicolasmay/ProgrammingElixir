defmodule Users do 
  dave = %{name: "Dave", state: "TX", likes: "programming"}

  case dave do 
    %{state: some_state} = person -> IO.puts("#{person.name} lives in #{some_state}")
    _ -> IO.puts("No matches")
  end

  case dave do
    %{state: some_state, likes: some_like} = person ->
      IO.puts("#{person.name} from #{some_state} likes #{some_like}")
    _ -> IO.puts("No matches")
  end


  nic = %{name: "Nic", age: 40}

  case nic do 
    person = %{age: age} when is_number(age) and age >= 21 ->
      IO.puts("You are cleared to enter the Foo Bar, #{person.name}")
    _ -> IO.puts("Sorry, no admission")
  end

end

