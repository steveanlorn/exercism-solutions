defmodule Lasagna do
  # Returns minutes to cook one lasagna.
  def expected_minutes_in_oven() do
    40
  end

  # Returns remaining minutes to cook one lasagna.
  def remaining_minutes_in_oven(minutes_in_oven) do
    remaining = expected_minutes_in_oven() - minutes_in_oven
    if remaining > 0 do
      remaining
    else
      0
    end
  end

  # Returns preparation time in minutes for making one lasagna.
  def preparation_time_in_minutes(layers_count) do
    minutes_per_layer = 2
    layers_count * minutes_per_layer
  end

  # Returns the sum of the time spent for preparation and cook the lasagna.
  def total_time_in_minutes(layers_count, minutes_in_oven) do
    preparation_time_in_minutes(layers_count) + minutes_in_oven
  end

  # Returns alarm denoting lasagna is ready to eat.
  def alarm() do
    "Ding!"
  end
end
