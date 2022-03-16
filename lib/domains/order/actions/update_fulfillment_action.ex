defmodule ShopifyEx.Order.UpdateFulfillmentAction do
  @moduledoc """
  Update a fulfillment of an order

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#put-orders-order-id-fulfillments-fulfillment-id
  """
  @schema %{
    shipment_status: ShopifyEx.Fulfillment.ShipmentStatus.enum(),
    tracking_number: :string
  }
  def perform(client, order_id, fulfillment_id, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- build_request_params(request_params),
         {:ok, %{status: 200, body: %{"fulfillment" => fulfillment}}} <-
           ShopifyEx.ApiHelper.put(
             client,
             "/orders/#{order_id}/fulfillments/#{fulfillment_id}.json",
             request_params
           ) do
      {:ok, fulfillment}
    else
      {:ok, %{body: body}} ->
        {:error, body}

      {:error, errors} ->
        {:error, errors}

      _error ->
        {:error, "Something went wrong"}
    end
  end

  defp build_request_params(params) do
    params = ShopifyEx.MapHelper.clean_nil(params)
    %{fulfillment: params}
  end
end
