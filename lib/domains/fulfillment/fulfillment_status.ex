defmodule ShopifyEx.Fulfillment.FulfillmentStatus do
  @moduledoc """
  Fulfillment status enumeration

  Reference

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#resource-object
  """
  @doc """
  Shopify has created the fulfillment and is waiting for the third-party fulfillment service
  to transition it to 'open' or 'success'.
  """
  def pending, do: "pending"

  @doc """
  The fulfillment has been acknowledged by the service and is in processing.
  """
  def open, do: "open"

  @doc """
  The fulfillment was successful.
  """
  def success, do: "success"

  @doc """
  The fulfillment was cancelled.
  """
  def cancelled, do: "cancelled"

  @doc """
  There was an error with the fulfillment request.
  """
  def error, do: "error"

  @doc """
  The fulfillment request failed.
  """
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
