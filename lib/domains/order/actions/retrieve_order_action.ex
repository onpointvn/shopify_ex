defmodule ShopifyEx.Order.RetrieveOrderAction do
  @moduledoc """
  Retrieve a specific order

  **Reference**

  https://shopify.dev/api/admin-rest/2022-01/resources/order#get-orders-order-id
  """
  def perform(client, order_id) do
    api_version = ShopifyEx.get_api_version()

    client
    |> ShopifyEx.ApiHelper.get("/admin/api/#{api_version}/orders/#{order_id}.json")
    |> case do
      {:ok, %{status: 200, body: %{"order" => order}}} ->
        {:ok, order}

      {:ok, %{body: body}} ->
        {:error, body}

      _error ->
        {:error, "Something went wrong"}
    end
  end
end
