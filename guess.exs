defmodule Chop do
  def chopper(x, y) do
    div(x - y + rem(x - y, 2), 2) + y
  end

  def guess(actual, first..last)
      when div(last - first + rem(last - first, 2), 2) + first === actual do
    half = chopper(first, last)
    IO.puts("Is it #{half}")
    IO.puts(half)
  end

  def guess(actual, first..last)
      when div(last - first + rem(last - first, 2), 2) + first > actual do
    half = chopper(first, last)
    IO.puts("Is it #{half}")
    guess(actual, first..half)
  end

  def guess(actual, first..last)
      when div(last - first + rem(last - first, 2), 2) + first < actual do
    half = chopper(first, last)
    IO.puts("Is it #{half}")
    guess(actual, half..last)
  end
end
