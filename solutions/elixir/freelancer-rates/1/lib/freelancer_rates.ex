defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8 * hourly_rate / 1
  end

  def apply_discount(before_discount, discount) do
    before_discount - (discount / 100 * before_discount)
  end

  def monthly_rate(hourly_rate, discount) do
    rate = 22 * daily_rate(hourly_rate)
    ceil(apply_discount(rate, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    rate = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / rate, 1)
  end
end
