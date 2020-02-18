defmodule ControlFlow do
  def fizz_buzz(n) do
    1..n
    |> Enum.map(fn x ->
      case [rem(x, 3) + rem(x, 5), rem(x, 3), rem(x, 5)] do
        [0, 0, 0] -> "FizzBuzz"
        [_, 0, _] -> "Fizz"
        [_, _, 0] -> "Buzz"
        _ -> x
      end
    end)
  end

  def ok!(func) do
    case func do
      {:ok, data} ->
        data

      _ ->
        raise "Failed to execute #{func}"
    end
  end
end
