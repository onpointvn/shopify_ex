defmodule ShopifyEx.Order.OrderStatus do
  @moduledoc """
  Order status enumeration

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  def open, do: "open"

  def closed, do: "closed"

  def cancelled, do: "cancelled"

  def enum do
    [
      open(),
      closed(),
      cancelled()
    ]
  end
end
