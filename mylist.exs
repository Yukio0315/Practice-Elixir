defmodule MyList do
  @z_number 122
  @num_of_alpha 26
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]
  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]
  # def sum([], total), do: total
  # def sum([head | tail], total), do: sum(tail, head + total)
  # def sum(list), do: _sum(list, 0)
  # defp _sum([], total), do: total
  # defp _sum([head | total], total), do: _sum(total, head + total)
  def sum([head | []]), do: head
  def sum([head, head1 | tail]), do: sum([head + head1 | tail])
  def sum([head | tail]), do: head + tail
  def reduce([], value, _), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)
  def mapsum(list, func), do: _mapsum(list, func, 0)
  defp _mapsum([], _func, total), do: total
  defp _mapsum([head | tail], func, total), do: _mapsum(tail, func, total + func.(head))
  def max([head | []]), do: head
  def max([head, head1 | tail]) when head < head1, do: max([head1 | tail])
  def max([head, head1 | tail]) when head > head1, do: max([head | tail])
  def max([head | tail]) when head > tail, do: max([head | []])
  def max([head | tail]) when head < tail, do: max([tail | []])
  def caesar([], _num), do: []

  def caesar([head | tail], num) when head + num > @z_number,
    do: [head + num - @num_of_alpha | caesar(tail, num)]

  def caesar([head | tail], num) when head + num < @z_number, do: [head + num | caesar(tail, num)]
  def span(list, from, to), do: _span(list, from, to, [])
  defp _span([], _, _, result), do: result

  defp _span([head | tail], from, to, result) when head >= from and head <= to,
    do: _span(tail, from, to, result ++ [head])

  defp _span([_ | tail], from, to, result), do: _span(tail, from, to, result)
end
