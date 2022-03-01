defmodule ShopifyEx.Fulfillment.FulfillmentStatus do
  @moduledoc """
  Fulfillment status enumeration

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#resource-object
  """
  def pending, do: "pending"

  def open, do: "open"

  def success, do: "success"

  def cancelled, do: "cancelled"

  def error, do: "error"

  def failure, do: "failure"

  def enum do
    [
      pending(),
      open(),
      success(),
      cancelled(),
      error(),
      failure()
    ]
  end
end
