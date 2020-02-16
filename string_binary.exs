defmodule StringAndBinaries do
  def is_printable(list), do: _is_printable(list, true)

  defp _is_printable([], true), do: true

  defp _is_printable([head | tail], true)
       when head >= 32 and head <= 127,
       do: _is_printable(tail, true)

  defp _is_printable(_, _), do: false

  def anagram?(word1, word2) do
    if word1 -- word2 === [] do
      true
    else
      false
    end
  end

  def center(list) do
    max = _calc_max_length(list, 0)

    Enum.each(list, fn word -> IO.puts(_padding(word, max)) end)
  end

  defp _calc_max_length([], max_length), do: max_length

  defp _calc_max_length([head | tail], max_length) do
    if max_length < String.length(head) do
      _calc_max_length(tail, String.length(head))
    else
      _calc_max_length(tail, max_length)
    end
  end

  defp _padding(string, max) do
    string
    |> String.pad_leading(div(max - String.length(string), 2) + String.length(string))
    |> String.pad_trailing(max)
  end
end
