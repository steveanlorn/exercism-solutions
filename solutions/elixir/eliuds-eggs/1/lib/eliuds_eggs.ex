defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    dec_to_binaries([], number)
    |> Enum.count(fn bit -> bit == 1 end)
  end

  defp dec_to_binaries(binaries, 0), do: binaries

  defp dec_to_binaries(binaries, number) when number > 0 do
    quotient = div(number, 2)
    remainder = rem(number, 2)
    dec_to_binaries([remainder | binaries], quotient)
  end
end
