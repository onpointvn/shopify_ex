defmodule ShopifyEx.Order.CreateFulfillmentAction do
  @moduledoc """
  Create a new Fulfillment

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/fulfillment#post-orders-order-id-fulfillments
  """
  @schema %{
            # location_id: :integer
          }
  def perform(client, order_id, params) do
    with {:ok, request_params} <- Tarams.cast(params, @schema) do
      request_params = ShopifyEx.MapHelper.clean_nil(request_params)

      client
      |> ShopifyEx.ApiHelper.post(
        "/orders/#{order_id}/fulfillments.json",
        %{fulfillment: request_params}
      )
      |> case do
        {:ok, %{status: 201, body: %{"fulfillment" => fulfillment}}} ->
          {:ok, fulfillment}

        {:ok, %{body: body}} ->
          {:error, body}

        _error ->
          {:error, "Something went wrong"}
      end
    end
  end
end
