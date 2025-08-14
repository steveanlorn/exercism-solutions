defmodule BirdCount do

  def today([]), do: nil

  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]

  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([head | _tail]) when head == 0, do: true
  
  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)

  def total(list), do: total(list, 0)

  defp total([head | tail], count), do: total(tail, count + head) 

  defp total([], count), do: count

  def busy_days(list), do: busy_days(list, 0)

  defp busy_days([head | tail], count) when head >= 5 , do: busy_days(tail, count + 1)

  defp busy_days([_head | tail], count), do: busy_days(tail, count)

  defp busy_days([], count), do: count
end
