defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_head | tail]), do: tail

  def first([head | _tail]), do: head

  def count(list), do: count(list, 0)

  defp count([_head | tail], count), do: count(tail, count+1)
  
  defp count([], count), do: count

  def functional_list?(list), do: "Elixir" in list
end
