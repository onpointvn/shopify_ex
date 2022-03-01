defmodule ShopifyEx.Order.OrderFulfillmentStatus do
  @moduledoc """
  Order fulfillment status enumeration

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  def partial, do: "partial"

  def shipped, do: "shipped"

  def unshipped, do: "unshipped"

  def unfulfilled, do: "unfulfilled"

  def enum do
    [
      partial(),
      shipped(),
      unshipped(),
      unfulfilled()
    ]
  end
end
