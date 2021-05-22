authors = [
  %{name: "José", language: "Elixir"},
  %{name: "Matz", language: "Ruby"},
  %{name: "Larry", language: "Perl"}
]

languages_with_an_r = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

IO.inspect(get_in(authors, [languages_with_an_r, :name]))
IO.inspect(get_in(authors, [languages_with_an_r, :language]))

# Very little idea what the hell is going on here...
# Not very well explained in the book...
# Like what's the :get parameter? or next_fn?
# Unclear how things line up
