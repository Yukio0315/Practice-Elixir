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

    Enum.each(list, fn word ->
      IO.puts(
        word
        |> String.pad_leading(div(max - String.length(word), 2) + String.length(word))
        |> String.pad_trailing(max)
      )
    end)
  end

  defp _calc_max_length([], max_length), do: max_length

  defp _calc_max_length([head | tail], max_length) do
    if max_length < String.length(head) do
      _calc_max_length(tail, String.length(head))
    else
      _calc_max_length(tail, max_length)
    end
  end

  def capitalize_sentences(sentence) do
    sentence
    |> String.split(". ")
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(". ")
  end

  def file_parse do
    {:ok, file} = File.open("sales_info", fn file -> IO.read(file, :all) end)
    [head | tail] = String.split(file, "\n")

    Enum.map(tail, fn line ->
      [id, ship_to, net_amount] = String.split(line, ",")

      Enum.zip(
        Enum.map(String.split(head, ","), fn key -> String.to_atom(key) end),
        [
          String.to_integer(id),
          String.to_atom(String.trim_leading(ship_to, ":")),
          String.to_float(net_amount)
        ]
      )
    end)
  end
end
