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
end
