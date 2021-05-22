# Access.all() and Access.at() work on lists

cast = [
  %{
    character: "Buttercup",
    actor: %{ 
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{ 
      first: "Carey",
      last: "Elwes"
    },
    role: "farm boy"
  }
]

IO.inspect(get_in(cast, [Access.all(), :character]))
IO.inspect(get_in(cast, [Access.at(1), :role]))

IO.inspect(
  get_and_update_in(
    cast, 
    [Access.all(), :actor, :last],
    fn val -> {val, String.upcase(val)} end
  )
)


# Acess.elem() works on tuples

cast = [
  %{
    character: "Buttercup",
    actor:    {"Robin", "Wright"},
    role:      "princess"
  },
  %{
    character: "Westley",
    actor:    {"Carey", "Elwes"},
    role:      "farm boy"
  }
]

IO.inspect(get_in(cast, [Access.all(), :actor, Access.elem(1)]))
IO.inspect(
  get_and_update_in(
    cast, 
    [Access.all(), :actor, Access.elem(1)],
    fn val -> {val, String.reverse(val)} end
  )
)


# Access.key() and Access.key!() work on dict types (maps & structs)

cast = %{
  buttercup: %{
    actor:    {"Robin", "Wright"},
    role:      "princess"
  },
  westley: %{
    actor:    {"Carey", "Elwes"},
    role:      "farm boy"
  }
}

IO.inspect(
  get_in(
    cast,
    [Access.key(:westley), :actor, Access.elem(1)]
  )
)
IO.inspect(
  get_and_update_in(
    cast,
    [Access.key(:buttercup), :role],
    fn val -> {val, "queen"} end
  )
)
