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
  def span(from = [head | _], to) when length(from) + head - 1 >= to, do: from
  def span(from, to) when is_list(from) === false, do: span([from], to)

  def span(from = [head | _], to) when length(from) + head - 1 < to,
    do: span(from ++ [List.last(from) + 1], to)

  def all?(list, func), do: _all?(list, func, true)
  defp _all?([], _, result) when result === true, do: true
  defp _all?([head | tail], func, result) when result === true, do: _all?(tail, func, func.(head))
  defp _all?(_, _, false), do: false

  def each([], _), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter(list, func), do: _filter(list, func, [])
  defp _filter([], _, result), do: result

  defp _filter([head | tail], func, result) do
    if func.(head) do
      _filter(tail, func, result ++ [head])
    else
      _filter(tail, func, result)
    end
  end

  def split(list, num), do: _split(list, num, {[], []})
  defp _split([], _, result), do: result

  defp _split([head | tail], num, {result1, result2}) when length(result1) < num,
    do: _split(tail, num, {result1 ++ [head], result2})

  defp _split([head | tail], num, {result1, result2}) when length(result1) >= num,
    do: _split(tail, num, {result1, result2 ++ [head]})

  def take(list, num), do: _take(list, num, [])
  defp _take([], _, result), do: result

  defp _take([head | tail], num, result) when length(result) < num,
    do: _take(tail, num, result ++ [head])

  defp _take(_, _, result), do: result

  def flatten(list), do: _flatten(list, [], [])
  defp _flatten([], [], result), do: result
  defp _flatten([], tail, result), do: _flatten(tail, [], result)
  defp _flatten([head | tail], [], result) when is_list(head), do: _flatten(head, tail, result)
  defp _flatten([head], tail, result) when is_list(head), do: _flatten(head, tail, result)

  defp _flatten([head | tail], tail2, result) when is_list(head) === false,
    do: _flatten(tail, tail2, result ++ [head])

  def get_prime(n) do
    span(2, n) --
      for x <- span(2, n - 1),
          y <- span(3, n),
          x < y,
          rem(y, x) === 0,
          do: y
  end
end
