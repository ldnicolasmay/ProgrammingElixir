people = [
  %{name: "Grumpy", height: 1.24},
  %{name: "Dave", height: 1.88},
  %{name: "Dopey", height: 1.32},
  %{name: "Shaquille", height: 2.16},
  %{name: "Sneezy", height: 1.28}
]

(for person = %{height: height} <- people, height > 1.5, do: person)
|> IO.inspect

tall_people = for person = %{height: height} <- people, height > 1.5, do: person
tall_people |> IO.inspect()

tall_people = for person = %{name: _, height: height} <- people, height > 1.5, do: person 
tall_people |> IO.inspect()

IO.inspect(for person = %{height: height} <- people, height > 1.5, do: person)

(for num <- [1, 2, 3, 4, 5], num > 2, do: num * num)
|> IO.inspect()

cars = [
  %{year: 2018, make: "Subaru", model: "Outback", drive: "AWD", package: "Premium"},
  %{year: 2015, make: "Jeep", model: "Renegade", drive: "4WD", package: "Trailhawk"},
  %{year: 1979, make: "Chevrolet", model: "1500", drive: "2WD"}
]

(for car = %{package: package} <- cars, do: car)
|> IO.inspect(label: "Subaru and Jeep")

(for car = %{year: year, package: _} <- cars, year < 2017, do: car)
|> IO.inspect(label: "Jeep Crossover")

(for car = %{make: "Chevrolet"} <- cars, do: car)
|> IO.inspect(label: "Chevy Truck")
