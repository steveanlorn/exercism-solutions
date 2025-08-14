defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {num_a, denom_a} = a
    {num_b, denom_b} = b

    result_num = num_a * denom_b + num_b * denom_a
    result_denom = denom_a * denom_b
    
    reduce({result_num, result_denom})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {num_a, denom_a} = a
    {num_b, denom_b} = b

    result_num = num_a * denom_b - num_b * denom_a
    result_denom = denom_a * denom_b
    
    reduce({result_num, result_denom})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {num_a, denom_a} = a
    {num_b, denom_b} = b

    result_num = num_a * num_b
    result_denom = denom_a * denom_b
    
    reduce({result_num, result_denom})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(a :: rational, b :: rational) :: rational
  def divide_by(a, b) do
    {num_a, denom_a} = a
    {num_b, denom_b} = b

    result_num = num_a * denom_b
    result_denom = num_b * denom_a

    reduce({result_num, result_denom})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {num_a, denom_a} = a
    reduce({Kernel.abs(num_a), Kernel.abs(denom_a)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) when n > 0 do
    {num_a, denom_a} = a

    result_num = Integer.pow(num_a, n)
    result_denom = Integer.pow(denom_a, n)

    reduce({result_num, result_denom})
  end

  def pow_rational(a, n) do
    {num_a, denom_a} = a
    n_abs = Kernel.abs(n)

    result_num = Integer.pow(denom_a, n_abs)
    result_denom = Integer.pow(num_a, n_abs)

    reduce({result_num, result_denom})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {a, b} = n
    x_to_the_a = :math.pow(x, a)
    :math.pow(x_to_the_a, 1 / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(rational) :: rational
  def reduce(a) do
    {numerator, denominator} = a
    gcd = Integer.gcd(numerator, denominator)

    if denominator < 0 do
      {div(numerator, gcd) * -1, div(denominator, gcd) * -1}
    else
      {div(numerator, gcd), div(denominator, gcd)}
    end
  end
end
