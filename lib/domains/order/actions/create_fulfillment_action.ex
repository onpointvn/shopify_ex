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
      execute_request(client, order_id, request_params)
    end
  end

  defp execute_request(client, order_id, params) do
    api_version = ShopifyEx.get_api_version()

    request_params = %{
      order: params
    }

    client
    |> ShopifyEx.ApiHelper.post(
      "/admin/api/#{api_version}/orders/#{order_id}/fulfillments.json",
      request_params
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
