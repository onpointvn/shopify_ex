defmodule ShopifyEx.Order.OrderStatus do
  @moduledoc """
  Order status enumeration

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders
  """
  @doc """
  Order isn't fulfilled
  """
  @spec open() :: String.t()
  def open, do: "open"

  @doc """
  Order is fulfilled
  """
  @spec closed() :: String.t()
  def closed, do: "closed"

  @doc """
  Order is cancelled
  """
  @spec cancelled() :: String.t()
  def cancelled, do: "cancelled"

  def enum do
    [
      open(),
      closed(),
      cancelled()
    ]
  end
end
