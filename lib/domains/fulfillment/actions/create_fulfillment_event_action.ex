defmodule ShopifyEx.Fulfillment.CreateFulfillmentEventAction do
  @moduledoc """
  Create a fulfillment event

  **Reference**

  https://community.shopify.com/c/shopify-apis-and-sdks/how-to-update-the-order-status-through-the-api-along-with/td-p/540032
  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillmentevent#post-orders-order-id-fulfillments-fulfillment-id-events
  """
  @schema %{
    status: [type: :string, in: ShopifyEx.Fulfillment.ShipmentStatus.enum()]
  }
  def perform(client, order_id, fulfillment_id, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema),
         request_params <- build_request_params(request_params),
         {:ok, %{status: 200, body: %{"fulfillment_event" => event}}} <-
           ShopifyEx.ApiHelper.post(
             client,
             "/orders/#{order_id}/fulfillments/#{fulfillment_id}/events.json",
             request_params
           ) do
      {:ok, event}
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
    %{event: params}
  end
end
