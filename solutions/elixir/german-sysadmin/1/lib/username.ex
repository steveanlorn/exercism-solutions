defmodule Username do
  @german_chars_subtitution Map.new([
    {?ä, ~c"ae"},
    {?ö, ~c"oe"},
    {?ü, ~c"ue"},
    {?ß, ~c"ss"}
  ])

  def sanitize(username) do
    username
    |> Enum.flat_map(&substitute_german_char/1)
    |> Enum.filter(&allowed_character?/1)
  end

  defp substitute_german_char(char), do: Map.get(@german_chars_subtitution, char, [char])

  defp allowed_character?(char) do
    lower_case_letter?(char) or
    underscore?(char)
  end

  defp lower_case_letter?(char), do: char >= ?a and char <= ?z

  defp underscore?(char), do: char == ?_
end
