defmodule ShopifyEx.Fulfillment.ShipmentStatus do
  @moduledoc """
  Shipment status enumeration

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#resource-object
  """

  @doc """
  A label for the shipment was purchased and printed.
  """
  def label_printed, do: "label_printed"

  @doc """
  A label for the shipment was purchased, but not printed.
  """
  def label_purchased, do: "label_purchased"

  @doc """
  Delivery of the shipment was attempted, but unable to be completed.
  """
  def attempted_delivery, do: "attempted_delivery"

  @doc """
  The shipment is ready for pickup at a shipping depot.
  """
  def ready_for_pickup, do: "ready_for_pickup"

  @doc """
  The carrier is aware of the shipment, but hasn't received it yet.
  """
  def confirmed, do: "confirmed"

  @doc """
  The shipment is being transported between shipping facilities on the way to its destination.
  """
  def in_transit, do: "in_transit"

  @doc """
  The shipment is being delivered to its final destination.
  """
  def out_for_delivery, do: "out_for_delivery"

  @doc """
  The shipment was succesfully delivered.
  """
  def delivered, do: "delivered"

  @doc """
   Something went wrong when pulling tracking information for the shipment, such as the tracking number was invalid or the shipment was canceled.
  """
  def failure, do: "failure"

  def enum,
    do: [
      label_printed(),
      label_purchased(),
      attempted_delivery(),
      ready_for_pickup(),
      confirmed(),
      in_transit(),
      out_for_delivery(),
      delivered(),
      failure()
    ]
end
