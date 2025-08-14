defmodule Username do
  def sanitize(username) do
    username
    |> Enum.flat_map(fn char ->
      case char do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        ?_ -> [?_]
        c when c >= ?a and c <= ?z -> [c]
        _ -> []
      end
    end)
  end
end
