defmodule AddTax do
  # tax_rates = [NC: 0.075, TX: 0.08]

  # orders = [
  #   [id: 123, ship_to: :NC, net_amount: 100.00],
  #   [id: 124, ship_to: :OK, net_amount: 35.50],
  #   [id: 125, ship_to: :TX, net_amount: 24.00],
  #   [id: 126, ship_to: :TX, net_amount: 44.80],
  #   [id: 127, ship_to: :NC, net_amount: 25.00],
  #   [id: 128, ship_to: :MA, net_amount: 10.00],
  #   [id: 129, ship_to: :CA, net_amount: 102.00],
  #   [id: 130, ship_to: :NC, net_amount: 50.00]
  # ]

  def addTax(tax_rates, orders) do
    for {key, tax} <- tax_rates,
        order = [_, ship_to: country, net_amount: price] <- orders do
      if key === country do
        order ++ [total_amount: price + price * tax]
      else
        order ++ [total_amount: price]
      end
    end
    |> Enum.sort(&(&1[:total_amount] > &2[:total_amount]))
    |> Enum.uniq_by(fn [id: id, ship_to: _, net_amount: _, total_amount: _] -> id end)
    |> Enum.sort()
  end
end
